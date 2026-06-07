import router from '@ohos.router'

@Entry
@Component
struct SplashPage {
  // onPageShow(): void {
  //   setTimeout(() => {
  //     this.getUIContext().getRouter().pushUrl({ url: 'pages/LoginPage' })
  //   }, 5000)
  // }

  build() {
    // TODO:
    Stack({ alignContent: Alignment.TopEnd }) {
      // TODO:
      Image($r('app.media.macOS'))
        .width('100%').height('100%')

      Button('跳过')
        .fontSize('18')
        .fontColor(Color.White)
        .backgroundColor(Color.Black)
        .borderRadius(20)
        .margin("5%")
        // TODO:
        .onClick(() => {
          router.replace({ url: 'pages/LoginPage' })
        })
      Row() {
        Image($r('app.media.github'))
          .width(72).height(72)

        Column() {
          Text('数字社区')
            .fontSize('20')
            .fontColor(Color.White)
          Text('以数字生活提升社区品质')
        }
      }
      // TODO：
      .position({ x: '50%', y: '80%' })
      .translate({ x: '-50%' })

    }.width('100%').height('100%')

  }
}