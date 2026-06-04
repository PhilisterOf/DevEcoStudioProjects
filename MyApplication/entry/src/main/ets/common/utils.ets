// entry/src/main/ets/common/utils.ets
import http from '@ohos.net.http';
import promptAction from '@ohos.promptAction';

export const BASE_URL = 'http://192.168.1.100:8080';   // ← 改这里
let TOKEN = '';
export const setToken = (t: string) => TOKEN = t;
export const getToken = () => TOKEN;
export const toast = (msg: string) => promptAction.showToast({ message: msg, duration: 2000 });

export async function req(method: string, path: string, body?: object): Promise<ESObject> {
  const h = http.createHttp();
  try {
    const r = await h.request(BASE_URL + path, {
      method: method as http.RequestMethod,
      header: { 'Content-Type': 'application/json', 'Authorization': TOKEN ? `Bearer ${TOKEN}` : '' },
      extraData: body ? JSON.stringify(body) : undefined,
      connectTimeout: 10000, readTimeout: 10000
    });
    return JSON.parse(r.result as string);
  } catch { toast('网络错误'); return { code: -1 }; }
  finally { h.destroy(); }
}

export const get  = (p: string)           => req('GET',  p);
export const post = (p: string, d: object) => req('POST', p, d);
export const put  = (p: string, d: object) => req('PUT',  p, d);