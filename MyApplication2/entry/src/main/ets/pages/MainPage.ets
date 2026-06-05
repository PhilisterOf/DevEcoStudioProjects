import { http } from '@kit.NetworkKit';
import { EXAMPLE_URL } from '../common/httpstool';
import { promptAction } from '@kit.ArkUI';
import { it } from '@ohos/hypium';

// TODO:
// class Header {
//   public contentType: string;
//
//   constructor(contentType: string) {
//     this.contentType = contentType;
//   }
// }
interface ListDetail {
  id: number;
  plotId: number;
  buildingName: string;
}

interface MainList {
  total: number;
  rows?: ListDetail[];
  code?: number;
  msg?: string;
}

@Entry
@Component
struct MainPage {
  // TODO:
  @StorageLink('token') token: string = '';
  @State listDetail?: ListDetail[] = [];

  onPageShow(): void {
    this.getList();
  }

  getList() {
    // promptAction.showToast({ message: this.token, duration: 2000 })
    let httpRequest = http.createHttp();
    let options: http.HttpRequestOptions = {
      method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET。
      // 当使用POST请求时此字段用于传递请求体内容，具体格式与服务端协商确定。
      // TODO:
      // extraData: 'data to send',
      expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型。
      usingCache: true, // 可选，默认为true。
      priority: 1, // 可选，默认为1。
      // 开发者根据自身业务需要添加header字段。
      // TODO:
      header: { 'content-Type': 'application/json', 'Authorization': 'Bearer ' + this.token },
      // header: new Header('application/json')
      readTimeout: 60000, // 可选，默认为60000ms。
      connectTimeout: 60000, // 可选，默认为60000ms。
      usingProtocol: http.HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定。
      usingProxy: false, //可选，默认不使用网络代理，自API 10开始支持该属性。
    };
    // TODO:
    httpRequest.request(EXAMPLE_URL + '/api/community/modules/building/list?plotId=1', options,
      (err: Error, data: http.HttpResponse) => {
        if (!err) {
          // console.info('Result:' + data.result);
          // console.info('code:' + data.responseCode);
          // console.info('type:' + JSON.stringify(data.resultType));
          // console.info('header:' + JSON.stringify(data.header));
          // console.info('cookies:' + data.cookies); // 自API version 8开始支持cookie。
          promptAction.showToast({ message: 'SUCCESS1', duration: 2000 })
          // TODO:
          let res = JSON.parse(data.result as string) as MainList
          if (res.code === 200) {
            promptAction.showToast({ message: 'SUCCESS2', duration: 2000 })
            promptAction.showToast({ message: data.result as string, duration: 2000 })
            this.listDetail = res.rows
          } else {
            promptAction.showToast({ message: 'ERROR!', duration: 2000 })
          }
        } else {
          console.info('error:' + JSON.stringify(err));
        }
      });
  }

  build() {
    Column() {
      Row() {
        Column() {
          Text('早上好，Jack先生！')
            .fontSize('20')
            .fontColor(Color.White)
            .margin({ left: '5%', top: '10%' })
          Text('天府小区XXXXXX')
            .fontSize('20')
            .fontColor(Color.White)
            .margin({ left: '5%', top: '5' })
          // TODO:
        }.alignItems(HorizontalAlign.Start).width('72%')

        Image($r('app.media.github'))
        // TODO:
          .size({ width: 50, height: 50 })
      }
      .width('100%').height('20%')
      .backgroundColor(Color.Blue)

      Column() {
        Row() {
          Text('门禁')
            .width('50%')
            .height('50%')
            .backgroundColor(Color.Gray)
            .borderRadius('5')
            // TODO:
            .textAlign(TextAlign.Center)
          Text('缴费')
            .width('50%')
            .height('50%')
            .backgroundColor(Color.Gray)
            .borderRadius('5')
            .textAlign(TextAlign.Center)
        }.width('100%')

        Row() {
          Text('报修')
            .width('50%')
            .height('50%')
            .backgroundColor(Color.Gray)
            .borderRadius('5')
            .textAlign(TextAlign.Center)
          Text('报事')
            .width('50%')
            .height('50%')
            .backgroundColor(Color.Gray)
            .borderRadius('5')
            .textAlign(TextAlign.Center)

        }.width('100%')

        // TODO:
      }.alignItems(HorizontalAlign.Center)
      .width('100%').height('25%')

      Text('物业服务')
        .fontSize('20')
        .textAlign(TextAlign.Start)
        .width('100%')
      Column({ space: 10 }) {


        ForEach(this.listDetail, (item: ListDetail, index: number) => {
          Column() {
            Text('id:' + item.id)
            Text('plotId:1' + item.buildingName)
            Text('buildingName:' + item.buildingName)
          }.width('100%').backgroundColor(Color.Gray)

        })
        // Column() {
        //   Text('id:1')
        //   Text('plotId:1')
        //   Text('buildingName:1build')
        // }.width('100%').backgroundColor(Color.Gray)
        //
        // Column() {
        //   Text('id:1')
        //   Text('plotId:1')
        //   Text('buildingName:1build')
        // }.width('100%').backgroundColor(Color.Gray)
        //
        // Column() {
        //   Text('id:1')
        //   Text('plotId:1')
        //   Text('buildingName:1build')
        // }.width('100%').backgroundColor(Color.Gray)
      }
      .alignItems(HorizontalAlign.Start)
      .width('100%')
      // TODO:
      .layoutWeight(1)

      Row({ space: 5 }) {
        Column() {
          Text('物业')
        }.width('25%').height(25).backgroundColor(Color.Gray).borderRadius(5)

        Column() {
          Text('社区')
        }.width('25%').height(25).backgroundColor(Color.Gray).borderRadius(5)

        Column() {
          Text('集市')
        }.width('25%').height(25).backgroundColor(Color.Gray).borderRadius(5)

        Column() {
          Text('我的')
        }.width('25%').height(25).backgroundColor(Color.Gray).borderRadius(5)
      }.width('100%').margin({ bottom: '-1%' })
    }.width('100%').height('100%')
  }
}