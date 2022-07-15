//引入express模块
const express = require("express");
//引入连接池模块
const pool = require("../pool.js");
//创建路由器对象
const router = express.Router();
//1.首页商品接口(get /index_product)
//接口地址：http://127.0.0.1:3000/v1/products/inpd
//请求方式：get
router.get("/inpd", (req, res, next) => {
  //执行SQL命令，将查询数据库
  pool.query(" select * from index_product", (err, r) => {
    if (err) {
      //如果SQL中出现错误，交给下一个错误处理中间件，阻止往后执行
      return next(err);
    }
    console.log(r);
    res.send({ code: 200, msg: "查询成功", data: r });
  });
});
module.exports = router;
