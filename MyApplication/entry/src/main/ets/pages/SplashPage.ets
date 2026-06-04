import router from '@ohos.router';

@Entry
@Component
struct SplashPage {
  @State n: number = 5;
  private t: number = -1;

  aboutToAppear() {
    this.t = setInterval(() => {
      this.n--;
      if (this.n <= 0) {
        this.go();
      }
    }, 1000);
  }

  aboutToDisappear() {
    clearInterval(this.t);
  }

  go() {
    clearInterval(this.t);
    router.replaceUrl({ url: 'pages/LoginPage' });
  }

  build() {
    Stack({alignContent: Alignment.TopEnd}) {
      Column()
        .width('100%').height('100%')
        .backgroundColor('#1976d2')

      Column({ space: 8 }) {
        Image($r('app.media.github')).width(72).height(72).borderRadius(16)
        Text('数字社区').fontSize(26).fontColor(Color.White).fontWeight(FontWeight.Bold)
        Text('以数字生活提升社区品质').fontSize(13).fontColor('rgba(255,255,255,0.8)')
      }
      .width('100%')
      .position({ x: '50%', y: '70%' })
      .translate({ x: '-50%' })

      Button(`跳过 ${this.n}s`)
        .fontSize(14)
        .fontColor(Color.White)
        .backgroundColor('rgba(0,0,0,0.3)')
        .borderRadius(20)
        .padding({ left: 14, right: 14, top: 7, bottom: 7 })
        .margin({ top: '5%', right: '5%' })
        .onClick(() => this.go())
    }
  }
}