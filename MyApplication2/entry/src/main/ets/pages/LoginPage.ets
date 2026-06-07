import router from '@ohos.router';
import { http } from '@kit.NetworkKit';
import { EXAMPLE_URL } from '../common/httpstool';
import { promptAction } from '@kit.ArkUI';

// TODO:1
// class Header {
//   public contentType: string;
//   constructor(contentType: string) {
//     this.contentType = contentType;
//   }
// }
// TODO:2
interface LoginResponse {
  code: number;
  msg: string;
  token?: string; // token 是可选的，因为如果 code 是 400 可能就没有 token
}

@Entry
@Component
struct LoginPage {
  @State phonenumber: string = '';
  @State password: string = '';

  login() {
    let httpRequest = http.createHttp();
    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.POST, // 可选，默认为http.RequestMethod.GET。
      // 当使用POST请求时此字段用于传递请求体内容，具体格式与服务端协商确定。
      // TODO: 1
      extraData: JSON.stringify({
        phone: this.phonenumber,
        password: this.password
      }),
      expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型。
      usingCache: true, // 可选，默认为true。
      priority: 1, // 可选，默认为1。
      // 开发者根据自身业务需要添加header字段。
      // TODO: 2
      header: { 'Content-Type': 'application/json' },
      // header: new Header('application/json')
      readTimeout: 60000, // 可选，默认为60000ms。
      connectTimeout: 60000, // 可选，默认为60000ms。
      usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定。
      usingProxy: false, //可选，默认不使用网络代理，自API 10开始支持该属性。
    };

    // TODO: 3
    httpRequest.request(EXAMPLE_URL + '/api/community/user/phone/login', options,
      (err: Error, data: http.HttpResponse) => {
        if (!err) {
          // console.info('Result:' + data.result);
          // console.info('code:' + data.responseCode);
          // console.info('type:' + JSON.stringify(data.resultType));
          // console.info('header:' + JSON.stringify(data.header));
          // console.info('cookies:' + data.cookies); // 自API version 8开始支持cookie。
          // TODO: 4
          let res = JSON.parse(data.result as string) as LoginResponse;
          if (res.code === 200) {
            console.info('zzz:SUCCESS,Token:' + res.token)
            AppStorage.SetOrCreate("token", res.token)
            router.replace({ url: 'pages/MainPage' })
            // router.pushUrl({ url: 'pages/MainPage' })
          } else {
            console.info(JSON.stringify(err));
            // TODO: 5
            promptAction.showToast({ message: res.msg, duration: 2000 })
          }
        } else {
          // TODO:
          console.info('zzz:error:' + JSON.stringify(err));
          // console.info('error:' + JSON.stringify(err));
        }
      });
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Image($r("app.media.macOS"))
      Text('SIGN IN')
        .fontColor(Color.White)
        .fontSize(20)
        .margin({ left: "5%", top: "30%" })
      Text('欢迎登录')
        .fontColor(Color.Blue)
        .fontSize(40)
        .margin({ left: "5%", top: "40%" })
      Text('数字社区')
        .fontColor(Color.Blue)
        .fontSize(30)
        .margin({ left: "5%", top: "50%" })
      // TODO: icon
      TextInput()
        .type(InputType.PhoneNumber)
        .backgroundColor(Color.White)
        .margin({ top: "60%", left: "5%" })
        .width('90%')
        .onChange((value: string) => {
          this.phonenumber = value;
        })
      TextInput()
        .type(InputType.Password)
        .backgroundColor(Color.White)
        .margin({ top: "75%", left: "5%" })
        .width('90%')
        .onChange((value: string) => {
          this.password = value;
        })
      // TODO: Radio
      Button('登录')
        .fontColor(Color.White)
        .fontSize(20)
        .backgroundColor('#007dfe')
        .margin({ top: "90%", left: "7.5%" })
        .width('85%')
        .onClick(() => {
          this.login();
          console.log('zzz:' + this.phonenumber + this.password)
        })
    }
  }
}