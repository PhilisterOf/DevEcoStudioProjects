// let title:string = '创意橘子花瓶'
// console.log('商品的标题', title);
let names: string[] = ['one', 'two', "three"]

@Entry
@ComponentV2
struct Index {
  // @State message: string = 'Hello World';
  // @Local num: number = 1
  @Builder
  titleBuilder (text: string) {
    Row() {
      Text(text)
        .fontColor('#fff')
        .fontWeight(700)
        .layoutWeight(1)
      Image($r('app.media.images'))
        .width(22)
        .fillColor('#fff')
    }
    .width('100%')
    .height(50)
  }

  build() {
    Column() {
      this.titleBuilder('hello')
      this.titleBuilder('world')

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#131313')
    .padding({left: 10, right: 10})
  }

  // build() {
  //   Column() {
  //     Row() {
  //       Text('-')
  //         .width(40)
  //         .height(40)
  //         .border({ width: 1, color: '#999', radius: { topLeft: 3, bottomLeft: 3 } })
  //         .textAlign(TextAlign.Center)
  //         .onClick(() => {
  //           this.num--
  //         })
  //
  //       Text(this.num.toString())
  //         .width(40)
  //         .height(40)
  //         .textAlign(TextAlign.Center)
  //         .border({ width: { top: 1, bottom: 1 }, color: '#999' })
  //         .fontSize(18)
  //
  //       Text('+')
  //         .width(40)
  //         .height(40)
  //         .border({ width: 1, color: '#999', radius: { topRight: 3, bottomRight: 3 } })
  //         .textAlign(TextAlign.Center)
  //         .onClick(() => {
  //           this.num++
  //         })
  //     }
  //     .padding(50)
  //   }
  //   .padding(20)
  // }

  // build() {
  //   Column() {
  //     Text('maybe you like it.')
  //       .fontColor(Color.White)
  //       .width('100%')
  //       .margin({ bottom: 10 })
  //     List() {
  //       ListItem() {
  //         Row() {
  //           Image($r('app.media.images'))
  //             .width(80)
  //             .border({ radius: 8 })
  //             .margin({ right: 10 })
  //
  //           Column() {
  //             Text('Baby')
  //               .fontColor("#ffffff")
  //               .width('100%')
  //               .fontWeight(700)
  //               .margin({ bottom: 15 })
  //             Row() {
  //               Text('VIP')
  //                 .fontColor('#ffffff')
  //                 .border({ width: 1, color: '#ffffff', radius: 12 })
  //                 .padding({
  //                   left: 5,
  //                   right: 5,
  //                   top: 3,
  //                   bottom: 3
  //                 })
  //                 .margin({ right: 10 })
  //
  //               Text('J.B.')
  //                 .fontColor('#ffffff')
  //             }
  //             .width('100%')
  //           }
  //           .layoutWeight(1)
  //
  //           Image($r('app.media.images'))
  //             .width(24)
  //             .fillColor('#ffffff')
  //         }
  //         .width('100%')
  //         .height(80)
  //         .backgroundColor(Color.Pink)
  //         .margin({ bottom: 10 })
  //       }
  //
  //       ListItem() {
  //         Row() {
  //           Image($r('app.media.images'))
  //             .width(80)
  //             .border({ radius: 8 })
  //             .margin({ right: 10 })
  //
  //           Column() {
  //             Text('Baby')
  //               .fontColor("#ffffff")
  //               .width('100%')
  //               .fontWeight(700)
  //               .margin({ bottom: 15 })
  //             Row() {
  //               Text('VIP')
  //                 .fontColor('#ffffff')
  //                 .border({ width: 1, color: '#ffffff', radius: 12 })
  //                 .padding({
  //                   left: 5,
  //                   right: 5,
  //                   top: 3,
  //                   bottom: 3
  //                 })
  //                 .margin({ right: 10 })
  //
  //               Text('J.B.')
  //                 .fontColor('#ffffff')
  //             }
  //             .width('100%')
  //           }
  //           .layoutWeight(1)
  //
  //           Image($r('app.media.images'))
  //             .width(24)
  //             .fillColor('#ffffff')
  //         }
  //         .width('100%')
  //         .height(80)
  //         .backgroundColor(Color.Pink)
  //         .margin({ bottom: 10 })
  //       }
  //
  //       ListItem() {
  //         Row() {
  //           Image($r('app.media.images'))
  //             .width(80)
  //             .border({ radius: 8 })
  //             .margin({ right: 10 })
  //
  //           Column() {
  //             Text('Baby')
  //               .fontColor("#ffffff")
  //               .width('100%')
  //               .fontWeight(700)
  //               .margin({ bottom: 15 })
  //             Row() {
  //               Text('VIP')
  //                 .fontColor('#ffffff')
  //                 .border({ width: 1, color: '#ffffff', radius: 12 })
  //                 .padding({
  //                   left: 5,
  //                   right: 5,
  //                   top: 3,
  //                   bottom: 3
  //                 })
  //                 .margin({ right: 10 })
  //
  //               Text('J.B.')
  //                 .fontColor('#ffffff')
  //             }
  //             .width('100%')
  //           }
  //           .layoutWeight(1)
  //
  //           Image($r('app.media.images'))
  //             .width(24)
  //             .fillColor('#ffffff')
  //         }
  //         .width('100%')
  //         .height(80)
  //         .backgroundColor(Color.Pink)
  //         .margin({ bottom: 10 })
  //       }
  //
  //       ListItem() {
  //         Row() {
  //           Image($r('app.media.images'))
  //             .width(80)
  //             .border({ radius: 8 })
  //             .margin({ right: 10 })
  //
  //           Column() {
  //             Text('Baby')
  //               .fontColor("#ffffff")
  //               .width('100%')
  //               .fontWeight(700)
  //               .margin({ bottom: 15 })
  //             Row() {
  //               Text('VIP')
  //                 .fontColor('#ffffff')
  //                 .border({ width: 1, color: '#ffffff', radius: 12 })
  //                 .padding({
  //                   left: 5,
  //                   right: 5,
  //                   top: 3,
  //                   bottom: 3
  //                 })
  //                 .margin({ right: 10 })
  //
  //               Text('J.B.')
  //                 .fontColor('#ffffff')
  //             }
  //             .width('100%')
  //           }
  //           .layoutWeight(1)
  //
  //           Image($r('app.media.images'))
  //             .width(24)
  //             .fillColor('#ffffff')
  //         }
  //         .width('100%')
  //         .height(80)
  //         .backgroundColor(Color.Pink)
  //         .margin({ bottom: 10 })
  //       }
  //
  //       ListItem() {
  //         Row() {
  //           Image($r('app.media.images'))
  //             .width(80)
  //             .border({ radius: 8 })
  //             .margin({ right: 10 })
  //
  //           Column() {
  //             Text('Baby')
  //               .fontColor("#ffffff")
  //               .width('100%')
  //               .fontWeight(700)
  //               .margin({ bottom: 15 })
  //             Row() {
  //               Text('VIP')
  //                 .fontColor('#ffffff')
  //                 .border({ width: 1, color: '#ffffff', radius: 12 })
  //                 .padding({
  //                   left: 5,
  //                   right: 5,
  //                   top: 3,
  //                   bottom: 3
  //                 })
  //                 .margin({ right: 10 })
  //
  //               Text('J.B.')
  //                 .fontColor('#ffffff')
  //             }
  //             .width('100%')
  //           }
  //           .layoutWeight(1)
  //
  //           Image($r('app.media.images'))
  //             .width(24)
  //             .fillColor('#ffffff')
  //         }
  //         .width('100%')
  //         .height(80)
  //         .backgroundColor(Color.Pink)
  //         .margin({ bottom: 10 })
  //       }
  //
  //       ListItem() {
  //         Row() {
  //           Image($r('app.media.images'))
  //             .width(80)
  //             .border({ radius: 8 })
  //             .margin({ right: 10 })
  //
  //           Column() {
  //             Text('Baby')
  //               .fontColor("#ffffff")
  //               .width('100%')
  //               .fontWeight(700)
  //               .margin({ bottom: 15 })
  //             Row() {
  //               Text('VIP')
  //                 .fontColor('#ffffff')
  //                 .border({ width: 1, color: '#ffffff', radius: 12 })
  //                 .padding({
  //                   left: 5,
  //                   right: 5,
  //                   top: 3,
  //                   bottom: 3
  //                 })
  //                 .margin({ right: 10 })
  //
  //               Text('J.B.')
  //                 .fontColor('#ffffff')
  //             }
  //             .width('100%')
  //           }
  //           .layoutWeight(1)
  //
  //           Image($r('app.media.images'))
  //             .width(24)
  //             .fillColor('#ffffff')
  //         }
  //         .width('100%')
  //         .height(80)
  //         .backgroundColor(Color.Pink)
  //         .margin({ bottom: 10 })
  //       }
  //
  //       ListItem() {
  //         Row() {
  //           Image($r('app.media.images'))
  //             .width(80)
  //             .border({ radius: 8 })
  //             .margin({ right: 10 })
  //
  //           Column() {
  //             Text('Baby')
  //               .fontColor("#ffffff")
  //               .width('100%')
  //               .fontWeight(700)
  //               .margin({ bottom: 15 })
  //             Row() {
  //               Text('VIP')
  //                 .fontColor('#ffffff')
  //                 .border({ width: 1, color: '#ffffff', radius: 12 })
  //                 .padding({
  //                   left: 5,
  //                   right: 5,
  //                   top: 3,
  //                   bottom: 3
  //                 })
  //                 .margin({ right: 10 })
  //
  //               Text('J.B.')
  //                 .fontColor('#ffffff')
  //             }
  //             .width('100%')
  //           }
  //           .layoutWeight(1)
  //
  //           Image($r('app.media.images'))
  //             .width(24)
  //             .fillColor('#ffffff')
  //         }
  //         .width('100%')
  //         .height(80)
  //         .backgroundColor(Color.Pink)
  //         .margin({ bottom: 10 })
  //       }
  //
  //       ListItem() {
  //         Row() {
  //           Image($r('app.media.images'))
  //             .width(80)
  //             .border({ radius: 8 })
  //             .margin({ right: 10 })
  //
  //           Column() {
  //             Text('Baby')
  //               .fontColor("#ffffff")
  //               .width('100%')
  //               .fontWeight(700)
  //               .margin({ bottom: 15 })
  //             Row() {
  //               Text('VIP')
  //                 .fontColor('#ffffff')
  //                 .border({ width: 1, color: '#ffffff', radius: 12 })
  //                 .padding({
  //                   left: 5,
  //                   right: 5,
  //                   top: 3,
  //                   bottom: 3
  //                 })
  //                 .margin({ right: 10 })
  //
  //               Text('J.B.')
  //                 .fontColor('#ffffff')
  //             }
  //             .width('100%')
  //           }
  //           .layoutWeight(1)
  //
  //           Image($r('app.media.images'))
  //             .width(24)
  //             .fillColor('#ffffff')
  //         }
  //         .width('100%')
  //         .height(80)
  //         .backgroundColor(Color.Pink)
  //         .margin({ bottom: 10 })
  //       }
  //
  //       ListItem() {
  //         Row() {
  //           Image($r('app.media.images'))
  //             .width(80)
  //             .border({ radius: 8 })
  //             .margin({ right: 10 })
  //
  //           Column() {
  //             Text('Baby')
  //               .fontColor("#ffffff")
  //               .width('100%')
  //               .fontWeight(700)
  //               .margin({ bottom: 15 })
  //             Row() {
  //               Text('VIP')
  //                 .fontColor('#ffffff')
  //                 .border({ width: 1, color: '#ffffff', radius: 12 })
  //                 .padding({
  //                   left: 5,
  //                   right: 5,
  //                   top: 3,
  //                   bottom: 3
  //                 })
  //                 .margin({ right: 10 })
  //
  //               Text('J.B.')
  //                 .fontColor('#ffffff')
  //             }
  //             .width('100%')
  //           }
  //           .layoutWeight(1)
  //
  //           Image($r('app.media.images'))
  //             .width(24)
  //             .fillColor('#ffffff')
  //         }
  //         .width('100%')
  //         .height(80)
  //         .backgroundColor(Color.Pink)
  //         .margin({ bottom: 10 })
  //       }
  //
  //       ListItem() {
  //         Row() {
  //           Image($r('app.media.images'))
  //             .width(80)
  //             .border({ radius: 8 })
  //             .margin({ right: 10 })
  //
  //           Column() {
  //             Text('Baby')
  //               .fontColor("#ffffff")
  //               .width('100%')
  //               .fontWeight(700)
  //               .margin({ bottom: 15 })
  //             Row() {
  //               Text('VIP')
  //                 .fontColor('#ffffff')
  //                 .border({ width: 1, color: '#ffffff', radius: 12 })
  //                 .padding({
  //                   left: 5,
  //                   right: 5,
  //                   top: 3,
  //                   bottom: 3
  //                 })
  //                 .margin({ right: 10 })
  //
  //               Text('J.B.')
  //                 .fontColor('#ffffff')
  //             }
  //             .width('100%')
  //           }
  //           .layoutWeight(1)
  //
  //           Image($r('app.media.images'))
  //             .width(24)
  //             .fillColor('#ffffff')
  //         }
  //         .width('100%')
  //         .height(80)
  //         .backgroundColor(Color.Pink)
  //         .margin({ bottom: 10 })
  //       }
  //
  //       ListItem() {
  //         Row() {
  //           Image($r('app.media.images'))
  //             .width(80)
  //             .border({ radius: 8 })
  //             .margin({ right: 10 })
  //
  //           Column() {
  //             Text('Baby')
  //               .fontColor("#ffffff")
  //               .width('100%')
  //               .fontWeight(700)
  //               .margin({ bottom: 15 })
  //             Row() {
  //               Text('VIP')
  //                 .fontColor('#ffffff')
  //                 .border({ width: 1, color: '#ffffff', radius: 12 })
  //                 .padding({
  //                   left: 5,
  //                   right: 5,
  //                   top: 3,
  //                   bottom: 3
  //                 })
  //                 .margin({ right: 10 })
  //
  //               Text('J.B.')
  //                 .fontColor('#ffffff')
  //             }
  //             .width('100%')
  //           }
  //           .layoutWeight(1)
  //
  //           Image($r('app.media.images'))
  //             .width(24)
  //             .fillColor('#ffffff')
  //         }
  //         .width('100%')
  //         .height(80)
  //         .backgroundColor(Color.Pink)
  //         .margin({ bottom: 10 })
  //       }
  //
  //     }
  //     .scrollBar(BarState.Off)
  //
  //   }
  //   .width('100%')
  //   .height('100%')
  //   .backgroundColor('#000000')
  //   .padding({ left: 10, right: 10 })
  //   // 扩充组件的安全区
  //   .expandSafeArea([SafeAreaType.SYSTEM])
  // }

  // build() {
  //   Column() {
  //     Text('123456')
  //       .width(100)
  //       .height(60)
  //       .backgroundColor(Color.Pink)
  //       .textAlign(TextAlign.Center)
  //       .border({
  //         width: 3,
  //         color: Color.Red,
  //         style: BorderStyle.Dotted,
  //         radius: 10
  //       })
  //   }
  // }

  // build() {
  //   Column() {
  //     Button('login')
  //       .width('100%')
  //       .margin({
  //         bottom: 20
  //       })
  //     Button('register')
  //       .width('100%')
  //   }
  //   .backgroundColor(Color.Gray)
  //   .padding(10)
  //   .padding({
  //     left: 10,
  //     top: 20,
  //     right: 30,
  //     bottom: 40
  //   })
  // }

  // build() {
  //   Column() {
  //     Image($r('app.media.background'))
  //       .width(200)
  //   }
  // }

  // build() {
  //   Column() {
  //     Text('nb')
  //       // fs
  //       .fontSize(30)
  //       // fc
  //       .fontColor(Color.Red)
  //       // fw
  //       .fontWeight(400)
  //
  //   }
  // }

  // build() {
  //   Column() {
  //     Text('nb')
  //       .backgroundColor(Color.Green)
  //       .width(360)
  //       // .width('100%')
  //       .height(50)
  //   }
  // }

  // build() {
  //   Column() {
  //     Text('nb')
  //     Text('nb')
  //     Text('nb')
  //     Text('nb')
  //     Text('nb')
  //     Row() {
  //       Text('nb')
  //       Text('nb')
  //       Text('nb')
  //       Text('nb')
  //       Text('nb')
  //     }
  //   }
  // }

  // build() {
  //   RelativeContainer() {
  //     Text(this.message)
  //       .id('HelloWorld')
  //       .fontSize($r('app.float.page_text_font_size'))
  //       .fontWeight(FontWeight.Bold)
  //       .alignRules({
  //         center: { anchor: '__container__', align: VerticalAlign.Center },
  //         middle: { anchor: '__container__', align: HorizontalAlign.Center }
  //       })
  //       .onClick(() => {
  //         this.message = 'Welcome';
  //       })
  //   }
  //   .height('100%')
  //   .width('100%')
  // }
  // }
}