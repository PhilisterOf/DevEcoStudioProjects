import router from '@ohos.router';
import { post, setToken, toast } from '../common/utils';

@Entry @Component struct LoginPage {
  @State phone: string = '13888888888';
  @State pwd: string = '123456';
  @State eye: boolean = false;
  @State err: string = '';

  async login() {
    if (!/^1[3-9]\d{9}$/.test(this.phone)) { this.err = '手机号格式不正确'; return; }
    const res: ESObject = await post('/api/user/login', { phone: this.phone, password: this.pwd }as ESObject);
    if (res.code === 200 || res.code === 0 || res.success) {
      setToken((res.data || res).token || '');
      router.replaceUrl({ url: 'pages/MainPage' });
    } else toast(res.msg || '登录失败');
  }

  build() {
    Column() {
      Column({ space: 6 }) {
        Text('SIGN IN').fontSize(30).fontWeight(FontWeight.Bold).fontColor(Color.White)
        Text('欢迎登录，智慧社区').fontSize(14).fontColor('rgba(255,255,255,0.85)')
      }.alignItems(HorizontalAlign.Start).width('100%').padding({ left: 28, top: 88, bottom: 36 })

      Column({ space: 16 }) {
        Column({ space: 4 }) {
          Row({ space: 10 }) {
            Text('📱').fontSize(18)
            TextInput({ placeholder: '手机号', text: this.phone }).layoutWeight(1)
              .backgroundColor(Color.Transparent).type(InputType.PhoneNumber)
              .onChange(v => { this.phone = v; this.err = ''; })
          }.padding(13).backgroundColor('#F5F7FA').borderRadius(10)
          if (this.err) Text(this.err).fontSize(12).fontColor(Color.Red)
        }
        Row({ space: 10 }) {
          Text('🔒').fontSize(18)
          TextInput({ placeholder: '密码', text: this.pwd }).layoutWeight(1)
            .backgroundColor(Color.Transparent).type(this.eye ? InputType.Normal : InputType.Password)
            .onChange(v => this.pwd = v)
        }.padding(13).backgroundColor('#F5F7FA').borderRadius(10)
        Row() {
          Text('快速注册').fontSize(14).fontColor('#1698CE')
            .onClick(() => router.pushUrl({ url: 'pages/RegisterPage' }))
          Blank()
          Text('忘记密码').fontSize(14).fontColor('#999')
        }.width('100%')
        Button('登录').width('100%').height(50).backgroundColor('#1698CE').borderRadius(25)
          .fontSize(17).onClick(() => this.login())
        Text('登录即表示同意《用户协议》和《隐私政策》')
          .fontSize(12).fontColor('#aaa').textAlign(TextAlign.Center).width('100%')
        Column({ space: 10 }) {
          Text('─── 其他登录方式 ───').fontSize(12).fontColor('#ccc')
          Row({ space: 48 }) {
            Column({ space: 4 }) { Text('💚').fontSize(36); Text('微信').fontSize(12).fontColor('#666') }
            Column({ space: 4 }) { Text('🔵').fontSize(36); Text('支付宝').fontSize(12).fontColor('#666') }
          }
        }.alignItems(HorizontalAlign.Center)
      }.padding({ left: 24, right: 24, top: 28, bottom: 36 })
      .backgroundColor(Color.White).borderRadius({ topLeft: 28, topRight: 28 }).layoutWeight(1)
    }.width('100%').height('100%').backgroundColor('#1976d2')
  }
}