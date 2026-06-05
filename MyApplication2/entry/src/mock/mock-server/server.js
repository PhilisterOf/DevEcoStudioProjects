const express = require('express');
const app = express();

app.use(express.json());

// ==========================================
// 1. 登录接口 (POST)
// ==========================================
app.post('/api/community/user/phone/login', (req, res) => {
    const { phone, password } = req.body;
    console.log(`收到登录请求 -> 手机号: ${phone}, 密码: ${password}`);

    if (phone === "123" && password === "456") {
        res.json({
            "msg": "操作成功1111",
            "code": 200,
            "token": "eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjQ4Njk3YzQ2LWNhYmUtNDg1OS05MjJhLTZmOTMxMGMzZmY1ZCJ9.D0DhJ35__HlyPu6vV6_6XZq9C9j7CuNNStPzWmIIpy3Rv297Xx6LCBn2YiX2fr1Pm1-h20VFeiSzzppgjwz6jA"
        });
    } else {
        res.status(400).json({
            "msg": "账号或密码错误",
            "code": 400
        });
    }
});

// ==========================================
// 2. 查询楼栋列表接口 (GET)
// ==========================================
app.get('/api/community/modules/building/list', (req, res) => {
    // 1. 提取 Authorization 和 plotId
    let rawToken = req.headers.authorization;
    const plotId = req.query.plotId; // 现在这是非必填项了

    console.log(`收到查询楼栋请求 -> 原始Token: ${rawToken}, plotId: ${plotId || '未提供'}`);

    // 2. 基本参数校验 (已移除 plotId 的强校验)
    if (!rawToken) {
        return res.status(401).json({ "msg": "缺少 Authorization 凭证", "code": 401 });
    }

    // 3. 处理 Token 格式
    let token = rawToken;
    if (rawToken.startsWith("Bearer ")) {
        token = rawToken.replace("Bearer ", "");
    }

    // 4. 【核心业务逻辑】：严格比对 Token
    const EXPECTED_TOKEN = "eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjQ4Njk3YzQ2LWNhYmUtNDg1OS05MjJhLTZmOTMxMGMzZmY1ZCJ9.D0DhJ35__HlyPu6vV6_6XZq9C9j7CuNNStPzWmIIpy3Rv297Xx6LCBn2YiX2fr1Pm1-h20VFeiSzzppgjwz6jA";

    if (token === EXPECTED_TOKEN) {
        
        // 容错处理：如果传了 plotId 就用传的数字，如果没传，默认设为 1
        const targetPlotId = plotId ? Number(plotId) : 1;

        console.log("Token 校验通过！返回楼栋数据。");
        res.json({
            "total": 3,
            "rows": [
                { "id": 1, "plotId": targetPlotId, "buildingName": "1栋" },
                { "id": 2, "plotId": targetPlotId, "buildingName": "2栋" },
                { "id": 3, "plotId": targetPlotId, "buildingName": "3栋" }
            ],
            "code": 200,
            "msg": "查询成功"
        });
    } else {
        console.error("Token 校验失败！");
        res.status(401).json({
            "msg": "无效的 Token 或登录已过期，请重新登录",
            "code": 401
        });
    }
});

// ==========================================
// 启动服务
// ==========================================
app.listen(8080, () => {
    console.log('Mock Server 已启动，监听端口: 8080');
});