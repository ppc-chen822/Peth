//引入express模块
const express = require("express");
//创建web服务器
const app = express();
//引入用户模块
const user = require("./routes/user");
const product = require("./routes/product");
const article = require("./routes/article");
//设置端口号3000
app.listen(3000, () => {
  console.log("服务启动成功，请勿关闭此窗口...");
});
///////////
app.all("*", (req, res, next) => {
  // res:响应  header:头 -- 响应头是给浏览器看的
  // Access-Control-Allow-Origin: *
  // 允许来源的访问有 : *      *代表所有来源, 是通配符
  res.header("Access-Control-Allow-Origin", "*");
  // 当前是拦截器, 调用next() 才能放行,  继续后续代码的运行
  next();
});
////////////
//托管静态资源到public目录
app.use(express.static("../public"));
//将所有post传参转为对象
app.use(
  express.urlencoded({
    extended: true,
  })
);
//使用用户路由器，给所有的路由添加前缀/v1/users
app.use("/v1/users", user);
app.use("/v1/products", product);
app.use("/v1/articles", article);

//添加错误处理中间件，拦截所有路由的错误
app.use((err, req, res, next) => {
  //err 接收到的路由传递的错误
  console.log(err);
  //响应服务器端错误
  res.send({ code: 500, msg: "服务器端错误" });
});
