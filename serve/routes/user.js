//引入express模块
const express = require("express");
//引入连接池模块
const pool = require("../pool.js");
//创建路由器对象
const router = express.Router();
//1.用户注册接口(post /reg)
//接口地址：http://127.0.0.1:3000/v1/users/reg
//请求方式：post
router.post("/reg", (req, res, next) => {
  //获取post传递的参数
  var obj = req.body;
  console.log(obj);
  //验证
  //用户名不能为空
  if (!obj.uname) {
    //obj.uname===''
    //响应的同时，阻止往后执行
    return res.send({ code: 401, msg: "用户名不能为空" });
  }
  //密码不能为空
  if (!obj.upwd) {
    return res.send({ code: 402, msg: "密码不能为空" });
  }
  //手机号不能为空
  if (!obj.phone) {
    return res.send({ code: 403, msg: "手机号不能为空" });
  }
  //执行SQL命令，将数据插入到数据库
  pool.query("insert into user set ?", [obj], (err, r) => {
    if (err) {
      //如果SQL中出现错误，交给下一个错误处理中间件，阻止往后执行
      return next(err);
    }
    console.log(r);
    res.send({ code: 200, msg: "注册成功" });
  });
});
//3.用户登录接口(post /login)
//接口地址：http://127.0.0.1:3000/v1/users/login
router.post("/login", (req, res, next) => {
  console.log(req.body);
  var obj = req.body;
  pool.query(
    "select * from user where phone= ? and upwd = ?",
    [obj.phone, obj.upwd],
    (err, r) => {
      if (err) {
        return next(err);
      } else {
        console.log(r);
      }
      if (r.length == 0) {
        res.send({
          code: 501,
          msg: "登录失败",
        });
      } else if (r[0].isAdmin) {
        res.send({
          code: 201,
          msg: "登录成功,管理员",
        });
      } else {
        res.send({
          code: 200,
          msg: "登录成功",
        });
      }
    }
  );
});
//查询用户是否已经注册
//请求方式：post
//接口地址：http://127.0.0.1:3000/v1/users/isreg
router.post("/isreg", (req, res, next) => {
  console.log(req.body);
  var obj = req.body;
  pool.query("select * from user where phone= ?", [obj.phone], (err, r) => {
    if (err) {
      return next(err);
    }
    if (r.length == 0) {
      res.send({
        code: 501,
        msg: "未注册",
      });
    } else {
      res.send({
        code: 200,
        msg: "已经注册",
      });
    }
  });
});
module.exports = router;
