//
//  SideMenu.swift
//  SlideMenu
//
//  Created by VT on 8/1/23.
//

import SwiftUI

struct SideMenu: View {
    
    var leftMenu: AnyView?
    var rightMenu: AnyView?
    
    var config: SideMenuConfig
    
    @State var leftMenuBGOpacity: Double = 0
    @State var rightMenuBGOpacity: Double = 0
    @State var leftMenuOffsetX: CGFloat = 0
    @State var rightMenuOffsetX: CGFloat = 0
    @State var isLandscape: Bool?
    
    @Environment(\.editMode) var editMode
    
    @State var sideMenuGestureMode: SideMenuGestureMode = .active
    @State var sideMenuLeftPanel: Bool = false
    @State var sideMenuRightPanel: Bool = false
    @State var sideMenuCenterView: AnyView
    
    private var menuAnimation: Animation {
        .easeOut(duration: config.animationDuration)
    }
    
    init<Menu: View, CenterView: View>(leftMenu: Menu, centerView: CenterView, config: SideMenuConfig = SideMenuConfig()) {
        self.leftMenu = AnyView(leftMenu)
        self._sideMenuCenterView = State(initialValue: AnyView(centerView))
        self.config = config
    }
    
    init<Menu: View, CenterView: View>(rightMenu: Menu, centerView: CenterView, config: SideMenuConfig = SideMenuConfig()) {
        self.leftMenu = AnyView(leftMenu)
        self._sideMenuCenterView = State(initialValue: AnyView(centerView))
        self.config = config
    }
    
    init<LeftMenu: View, CenterView: View, RightMenu: View>(leftMenu: LeftMenu, centerView: CenterView, rightMenu: RightMenu, config: SideMenuConfig = SideMenuConfig()) {
        self.leftMenu = AnyView(leftMenu)
        self._sideMenuCenterView = State(initialValue: AnyView(centerView))
        self.rightMenu = AnyView(rightMenu)
        self.config = config
    }
    
    var body: some View {
        return
            GeometryReader { geometry in
                ZStack {
                    NavigationView {
                        if (self.leftMenu != nil && self.rightMenu != nil) {
                            self.sideMenuCenterView
                                .opacity(1)
                                .transition(.opacity)
                                .navigationBarItems(
                                    leading: Button(action: {
                                        withAnimation {
                                            self.sideMenuLeftPanel.toggle()
                                        }
                                    }, label: {
                                        Image(systemName: "sidebar.left")
                                            .accentColor(.blue)
                                            .imageScale(.large)
                                    }),
                                    trailing: Button(action: {
                                        withAnimation {
                                            self.sideMenuRightPanel.toggle()
                                        }
                                    }, label: {
                                        Image(systemName: "sidebar.right")
                                            .accentColor(.red)
                                            .imageScale(.large)
                                    })
                                )
                            } else if (self.leftMenu != nil) {
                                self.sideMenuCenterView
                                    .opacity(1)
                                    .transition(.opacity)
                                    .navigationBarItems(
                                        leading: Button(action: {
                                            withAnimation {
                                                self.sideMenuLeftPanel.toggle()
                                            }
                                        }, label: {
                                            Image(systemName: "sidebar.left")
                                                .accentColor(.blue)
                                                .imageScale(.large)
                                        })
                                    )
                            } else if (self.rightMenu != nil) {
                                self.sideMenuCenterView
                                    .opacity(1)
                                    .transition(.opacity)
                                    .navigationBarItems(
                                        trailing: Button(action: {
                                            withAnimation {
                                                self.sideMenuRightPanel.toggle()
                                            }
                                        }, label: {
                                            Image(systemName: "sidebar.right")
                                                .accentColor(.red)
                                                .imageScale(.large)
                                        })
                                )
                            }
                    }
                if self.sideMenuLeftPanel && self.leftMenu != nil {
                    MenuBackgroundView(sideMenuLeftPanel: self.$sideMenuLeftPanel,
                                       sideMenuRightPanel: self.$sideMenuRightPanel,
                                       bgColor: self.config.menuBGColor,
                                       bgOpacity: self.leftMenuBGOpacity)
                        .zIndex(1)
                    
                    self.leftMenu!
                        .edgesIgnoringSafeArea(Edge.Set.all)
                        .frame(width: self.config.menuWidth)
                        .offset(x: self.leftMenuOffsetX, y: 0)
                        .transition(.move(edge: Edge.leading))
                        .zIndex(2)
                }
                
                if self.sideMenuRightPanel && self.rightMenu != nil {
                    MenuBackgroundView(sideMenuLeftPanel: self.$sideMenuLeftPanel,
                                       sideMenuRightPanel: self.$sideMenuRightPanel,
                                       bgColor: self.config.menuBGColor,
                                       bgOpacity: self.rightMenuBGOpacity)
                        .zIndex(3)
                    
                    self.rightMenu!
                        .edgesIgnoringSafeArea(Edge.Set.all)
                        .frame(width: self.config.menuWidth)
                        .offset(x: self.rightMenuOffsetX, y: 0)
                        .transition(.move(edge: Edge.trailing))
                        .zIndex(4)
                }
            }.gesture(self.panelDragGesture(geometry.size.width))
                .animation(self.menuAnimation)
                .onAppear {
                    self.leftMenuOffsetX = -self.menuXOffset(geometry.size.width)
                    self.rightMenuOffsetX = self.menuXOffset(geometry.size.width)
                    self.leftMenuBGOpacity = self.config.menuBGOpacity
                    self.rightMenuBGOpacity = self.config.menuBGOpacity
                }
                // Previously, the following was driven by a NotificationCenter event. But it wasn't handling rotations correctly all the time. It wasn't giving the right width on a rotation. I think it was gettig called before the GeometryReader change.
                // This is a little crude, but I wanted to have an update that occurred on any change to the view-- so I could test if the landscape/portrait orientation had changed.
                .modifier(CallOnViewUpdate({
                    let newIsLandscape = geometry.size.width > geometry.size.height
                    var update = false
                    if isLandscape == nil {
                        update = true
                    }
                    else if isLandscape != newIsLandscape {
                        update = true
                    }
                    
                    if update {
                        DispatchQueue.main.async {
                            self.isLandscape = newIsLandscape
                            self.rightMenuOffsetX = self.menuXOffset(geometry.size.width)
                            self.leftMenuOffsetX = -self.menuXOffset(geometry.size.width)
                        }
                    }
                }))
            .environment(\.sideMenuGestureModeKey, self.$sideMenuGestureMode)
            .environment(\.sideMenuCenterViewKey, self.$sideMenuCenterView)
            .environment(\.sideMenuLeftPanelKey, self.$sideMenuLeftPanel)
            .environment(\.sideMenuRightPanelKey, self.$sideMenuRightPanel)
            .environment(\.horizontalSizeClass, .compact)
        }
    }
    
    // Just a means to get some code executed when a View is updated.
    private struct CallOnViewUpdate: ViewModifier {
        init(_ closure: ()->()) {
            closure()
        }
        
        func body(content: Content) -> some View {
            content
        }
    }
    
    private func panelDragGesture(_ screenWidth: CGFloat) -> _EndedGesture<_ChangedGesture<DragGesture>>? {
        if let mode = self.editMode?.wrappedValue, mode != EditMode.inactive {
            return nil
        }
        if self.sideMenuGestureMode == SideMenuGestureMode.inactive {
            return nil
        }
        
        return DragGesture()
            .onChanged { (value) in
                self.onChangedDragGesture(value: value, screenWidth: screenWidth)
        }
            .onEnded { (value) in
            self.onEndedDragGesture(value: value, screenWidth: screenWidth)
        }
    }
    
    private func menuXOffset(_ screenWidth: CGFloat) -> CGFloat {
        return (screenWidth - (self.config.menuWidth))/2
    }
    
    //  MARK: Drag gesture methods
    func onChangedDragGesture(value: DragGesture.Value, screenWidth: CGFloat) {
        let startLocX = value.startLocation.x
        let translation = value.translation
        
        let translationWidth = translation.width > 0 ? translation.width : -(translation.width)
        
        let leftMenuGesturePositionX = screenWidth * 0.1
        let rightMenuGesturePositionX = screenWidth * 0.9
        
        guard translationWidth <= self.config.menuWidth else { return }
        
        if self.sideMenuLeftPanel, value.dragDirection == .left, self.leftMenu != nil {
            let newXOffset = -self.menuXOffset(screenWidth) - translationWidth
            self.leftMenuOffsetX = newXOffset
            
            let translationPercentage = (self.config.menuWidth - translationWidth) / self.config.menuWidth
            guard translationPercentage > 0 else { return }
            self.leftMenuBGOpacity = self.config.menuBGOpacity * Double(translationPercentage)
        } else if self.sideMenuRightPanel, value.dragDirection == .right, self.rightMenu != nil {
            let newXOffset = self.menuXOffset(screenWidth) + translationWidth
            self.rightMenuOffsetX = newXOffset
            
            let translationPercentage = (self.config.menuWidth - translationWidth) / self.config.menuWidth
            guard translationPercentage > 0 else { return }
            self.rightMenuBGOpacity = self.config.menuBGOpacity * Double(translationPercentage)
        } else if startLocX < leftMenuGesturePositionX, value.dragDirection == .right, self.leftMenu != nil {
            if !self.sideMenuLeftPanel {
                self.sideMenuLeftPanel.toggle()
            }
            
            let defaultOffset = -(self.menuXOffset(screenWidth) + self.config.menuWidth)
            let newXOffset = defaultOffset + translationWidth
            
            self.leftMenuOffsetX = newXOffset
            
            let translationPercentage = translationWidth / self.config.menuWidth
            
            guard translationPercentage > 0 else { return }
            self.leftMenuBGOpacity = self.config.menuBGOpacity * Double(translationPercentage)
        } else if startLocX > rightMenuGesturePositionX, value.dragDirection == .left, self.rightMenu != nil {
            if !self.sideMenuRightPanel {
                self.sideMenuRightPanel.toggle()
            }
            
            let defaultOffset = self.menuXOffset(screenWidth) + self.config.menuWidth
            let newXOffset = defaultOffset - translationWidth
            
            self.rightMenuOffsetX = newXOffset
            
            let translationPercentage = translationWidth / self.config.menuWidth
            guard translationPercentage > 0 else { return }
            self.rightMenuBGOpacity = self.config.menuBGOpacity * Double(translationPercentage)
        }
    }
    
    func onEndedDragGesture(value: DragGesture.Value, screenWidth: CGFloat) {
        let midXPoint = (0.5 * self.config.menuWidth)
        
        if self.sideMenuRightPanel, self.rightMenu != nil {
            let rightMenuMidX = self.menuXOffset(screenWidth) + midXPoint
            
            if self.rightMenuOffsetX > rightMenuMidX {
                self.sideMenuRightPanel.toggle()
            }
            
            self.rightMenuOffsetX = self.menuXOffset(screenWidth)
            self.rightMenuBGOpacity = self.config.menuBGOpacity
        } else if self.sideMenuLeftPanel, self.leftMenu != nil {
            let leftMenuMidX = -self.menuXOffset(screenWidth) - midXPoint
            
            if self.leftMenuOffsetX < leftMenuMidX {
                self.sideMenuLeftPanel.toggle()
            }
            
            self.leftMenuOffsetX = -self.menuXOffset(screenWidth)
            self.leftMenuBGOpacity = self.config.menuBGOpacity
        }
    }
}
