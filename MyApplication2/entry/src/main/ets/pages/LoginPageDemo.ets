import { http } from '@kit.NetworkKit';
interface data1 {
  code: number,
  msg: string,
  token: string
}

@Entry
@Component
struct LoginPageDemo {
  @State BaseUrl: string = '';
  @State data: data1 | null = null
  @State pwd: string | null = null

  fun() {
    let httpRequest = http.createHttp();
    httpRequest.request("", { method: http.RequestMethod.POST, extraData: { name: "123", pwd: this.pwd }, header: {"Content-Type":"application/json","Authorization":"token"} },
      (err: Error, data: http.HttpResponse) => {
        this.data = JSON.parse(data.result + "")
        //200
        AppStorage.SetOrCreate("key", this.data?.token)
        AppStorage.Get("key")
        this.getUIContext().getRouter().pushUrl({ url: "pages/LoginPage" })
      });
  }
  onPageShow(): void {
    this.fun()
  }


  build() {
    Column() {
      Column() {
        TextInput().type(InputType.Password).onChange((value: string) => {
          this.pwd = value
          console.log("111" + this.pwd)
        })
        TextInput().type(InputType.Password).onChange((value: string) => {
          this.pwd = value
          console.log("111" + this.pwd)
        }).margin({ top: 10 })
        Button("登录")
          .margin({ top: 100 })
          .width(70)
          .onClick(() => {
            this.fun()
          })
      }.margin({ top: "30%" })
    }.width("100%").height("100%").backgroundImage($r("app.media.macOS"))
  }
}