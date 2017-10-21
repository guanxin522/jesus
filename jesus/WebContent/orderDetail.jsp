<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags" 
%> 
<!DOCTYPE html>
<html>
 <head> 
  <meta charset="UTF-8" /> 
  <title>小米商城-个人中心</title> 
  <link rel="stylesheet" type="text/css" href="./resources/css/style2.css" /> 
  <link rel="stylesheet" type="text/css" href="./resources/css/base.min.css" /> 
  <link rel="stylesheet" type="text/css" href="./resources/css/main.min.css" /> 
 </head> 
 <body> 
  <!-- start header --> 
  <jsp:include page="header.jsp" /> 
  <!--end header --> 
  <!-- start banner_x --> 
  <!-- end banner_x --> 
  <!-- self_info --> 
  <div class="grzxbj" style="padding-top: 60px;"> 
   <div class="selfinfo center"> 
    <div class="lfnav fl"> 
     <div class="ddzx">
       订单中心 
     </div> 
     <div class="subddzx"> 
      <ul> 
       <li><a href="${pageContext.request.contextPath}/showUnpaidtOrdersAction">待付款订单</a></li> 
       <li><a href="${pageContext.request.contextPath}/showPaidtOrdersAction">历史订单</a></li> 
      </ul> 
     </div> 
     <div class="ddzx">
       个人中心 
     </div> 
     <div class="subddzx"> 
      <ul> 
       <li><a href="#">我的个人中心</a></li> 
       <li><a href="">收货地址</a></li> 
      </ul> 
     </div> 
    </div> 
    <div class="span16"> 
     <div class="uc-box uc-main-box"> 
      <div class="uc-content-box order-view-box"> 
       <div class="box-hd"> 
        <h1 class="title">订单详情<small>请谨防钓鱼链接或诈骗电话，<a href="http://bbs.xiaomi.cn/thread/index/tid/11508301" target="_blank" data-stat-id="b027715c015d6e08" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-b027715c015d6e08', 'http://bbs.xiaomi.cn/thread/index/tid/11508301', 'pcpid', '']);">了解更多&gt;</a></small></h1> 
        <div class="more clearfix"> 
         <h2 class="subtitle">订单号：1171021946411519 <span class="tag tag-subsidy"></span> </h2> 
         <div class="actions"> 
          <a id="J_cancelOrder" class="btn btn-small btn-line-gray" title="取消订单" data-order-id="1171021946411519" href="javascript:;" data-confirm="你真的要取消此订单吗?" data-stat-id="f2984c5b48c41d13" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-f2984c5b48c41d13', 'javascript:', 'pcpid', '']);">取消订单</a>
          <a id="J_payOrder" class="btn btn-small btn-primary" title="立即支付" href="http://order.mi.com/buy/confirm?id=1171021946411519" target="_blank" data-stat-id="cf85a6bf9dac5fc1" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-cf85a6bf9dac5fc1', 'http://order.mi.com/buy/confirmid=1171021946411519', 'pcpid', '']);">立即支付</a> 
         </div> 
        </div> 
       </div> 
       <div class="box-bd"> 
        <div class="uc-order-item uc-order-item-pay"> 
         <div class="order-detail"> 
          <div class="order-summary"> 
           <div class="order-status">
             等待付款 
           </div> 
           <div class="order-desc">
            49分后订单将被关闭
           </div> 
           <div class="order-progress"> 
            <ol class="progress-list clearfix progress-list-5"> 
             <li class="step step-first step-active"> 
              <div class="progress">
               <span class="text">下单</span>
              </div> 
              <div class="info">
               10月21日 12:40
              </div> </li> 
             <li class="step"> 
              <div class="progress">
               <span class="text">付款</span>
              </div> 
              <div class="info"></div> </li> 
             <li class="step"> 
              <div class="progress">
               <span class="text">配货</span>
              </div> 
              <div class="info"></div> </li> 
             <li class="step"> 
              <div class="progress">
               <span class="text">出库</span>
              </div> 
              <div class="info"></div> </li> 
             <li class="step step-last"> 
              <div class="progress">
               <span class="text">交易成功</span>
              </div> 
              <div class="info"></div> </li> 
            </ol> 
           </div> 
          </div> 
          <!-- 首次查看密码 --> 
          <div class="order-liwu J_giftcard_active hide"> 
           <div class="box"> 
            <h3>激活并获取 小米礼物码 密码</h3> 
            <p>点击获取密码后，我们将向账户绑定的手机 发送一条验证码<br />由于密码的特殊性，获取后不再支持7天无理由退货</p> 
            <a href="javascript:void(0);" class="btn btn-primary J_getGiftViewcode" data-stat-id="a23d55b9e18fc08a" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-a23d55b9e18fc08a', 'javascript:void0', 'pcpid', '']);">获取密码</a> 
           </div> 
          </div> 
          <!-- 账号未绑定手机号 --> 
          <div class="order-liwu J_giftcard_bind hide"> 
           <div class="box"> 
            <h3>您的账号尚未绑定手机号</h3> 
            <p>为了密码的安全性，获取密码以及每次查看密码都需要通过小米账号绑定的手机号进行验证<br />您的账号尚未绑定手机号，需要绑定手机号后继续操作</p> 
            <a href="//account.xiaomi.com/" target="_blank" class="btn btn-primary " data-stat-id="045af825eddc79cb" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-045af825eddc79cb', '//account.xiaomi.com/', 'pcpid', '']);">前往 账号中心</a> 
           </div> 
          </div> 
          <!-- Token已过期，再次查看密码 --> 
          <div class="order-liwu J_giftcard_view hide"> 
           <div class="box"> 
            <h3>查看 小米礼物码 密码</h3> 
            <p>点击查看密码后，我们将向账户绑定的手机 发送一条验证码</p> 
            <a href="javascript:void(0);" class="btn btn-primary J_getGiftcode" data-stat-id="b95059948ec21a01" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-b95059948ec21a01', 'javascript:void0', 'pcpid', '']);">查看密码</a> 
           </div> 
          </div> 
          <!-- 礼物码领取后 --> 
          <div class="order-liwu-list J_liwulist hide"> 
           <h3>小米礼物码 密码</h3> 
           <table> 
           </table> 
           <p>* 电脑访问 <a href="//www.mi.com/giftcode/" target="_blank" data-stat-id="6636cdbc657762ae" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-6636cdbc657762ae', '//www.mi.com/giftcode/', 'pcpid', '']);">http://www.mi.com/giftcode/</a> 根据提示使用礼物码，或在小米商城App中以此点击「服务」-「使用礼物码」</p> 
          </div> 
          <table class="order-items-table"> 
           <tbody>
            <tr> 
             <td class="col col-thumb"> 
              <div class="figure figure-thumb"> 
               <a target="_blank" href="//item.mi.com/1173800030.html" data-stat-id="71c3a5d2ecec130c" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-71c3a5d2ecec130c', '//item.mi.com/1173800030.html', 'pcpid', '']);"> <img src="//i1.mifile.cn/a1/pms_1505903266.08411470!80x80.jpg" width="80" height="80" alt="" /> </a> 
              </div> </td> 
             <td class="col col-name"> <p class="name"> <a target="_blank" href="//item.mi.com/1173800030.html" data-stat-id="a0a9ea44c839f160" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-a0a9ea44c839f160', '//item.mi.com/1173800030.html', 'pcpid', '']);">小米Note 3 全网通版 6GB内存 亮蓝色 64GB</a> </p> </td> 
             <td class="col col-price"> <p class="price">2599元 &times; 1</p> </td> 
             <td class="col col-actions"> </td> 
            </tr> 
            <tr> 
             <td class="col col-thumb"> 
              <div class="figure figure-thumb"> 
               <a target="_blank" href="//item.mi.com/1161200011.html" data-stat-id="74c6b636df71d530" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-74c6b636df71d530', '//item.mi.com/1161200011.html', 'pcpid', '']);"> <img src="//i1.mifile.cn/a1/pms_1467184989.74561304!80x80.jpg" width="80" height="80" alt="" /> </a> 
              </div> </td> 
             <td class="col col-name"> <p class="name"> <a target="_blank" href="//item.mi.com/1161200011.html" data-stat-id="4b5a85b42afcb631" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-4b5a85b42afcb631', '//item.mi.com/1161200011.html', 'pcpid', '']);">小米圈铁耳机 银色</a> </p> </td> 
             <td class="col col-price"> <p class="price">0元 &times; 1</p> </td> 
             <td class="col col-actions"> </td> 
            </tr> 
            <tr> 
             <td class="col col-thumb"> 
              <div class="figure figure-thumb"> 
               <a target="_blank" href="//item.mi.com/1172700042.html" data-stat-id="41705d1777b600be" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-41705d1777b600be', '//item.mi.com/1172700042.html', 'pcpid', '']);"> <img src="//i1.mifile.cn/a1/pms_1505961151.72192129!80x80.jpg" width="80" height="80" alt="" /> </a> 
              </div> </td> 
             <td class="col col-name"> <p class="name"> <a target="_blank" href="//item.mi.com/1172700042.html" data-stat-id="48f98405109bd5a3" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-48f98405109bd5a3', '//item.mi.com/1172700042.html', 'pcpid', '']);">小米Note 3 标准高透保护膜 高透</a> </p> </td> 
             <td class="col col-price"> <p class="price">0元 &times; 1</p> </td> 
             <td class="col col-actions"> </td> 
            </tr> 
            <tr> 
             <td class="col col-thumb"> 
              <div class="figure figure-thumb"> 
               <a target="_blank" href="//item.mi.com/1172900006.html" data-stat-id="cf17bcad2c76d802" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-cf17bcad2c76d802', '//item.mi.com/1172900006.html', 'pcpid', '']);"> <img src="//i1.mifile.cn/a1/pms_1505875677.86046003!80x80.jpg" width="80" height="80" alt="" /> </a> 
              </div> </td> 
             <td class="col col-name"> <p class="name"> <a target="_blank" href="//item.mi.com/1172900006.html" data-stat-id="3ac08a7ca4c609b1" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-3ac08a7ca4c609b1', '//item.mi.com/1172900006.html', 'pcpid', '']);">小米Note 3 硅胶保护套 黑色</a> </p> </td> 
             <td class="col col-price"> <p class="price">0元 &times; 1</p> </td> 
             <td class="col col-actions"> </td> 
            </tr> 
            <tr> 
             <td class="col col-thumb"> 
              <div class="figure figure-thumb"> 
               <a target="_blank" href="//item.mi.com/1173000036.html" data-stat-id="826c0634897a2e15" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-826c0634897a2e15', '//item.mi.com/1173000036.html', 'pcpid', '']);"> <img src="//i1.mifile.cn/a1/pms_1501236937.96732594!80x80.jpg" width="80" height="80" alt="" /> </a> 
              </div> </td> 
             <td class="col col-name"> <p class="name"> <a target="_blank" href="//item.mi.com/1173000036.html" data-stat-id="d7d352b9022dfd72" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-d7d352b9022dfd72', '//item.mi.com/1173000036.html', 'pcpid', '']);">米粉卡日租卡</a> </p> </td> 
             <td class="col col-price"> <p class="price">0元 &times; 1</p> </td> 
             <td class="col col-actions"> </td> 
            </tr> 
            <tr> 
             <td class="col col-thumb"> 
              <div class="figure figure-thumb"> 
               <a target="_blank" href="//item.mi.com/1173600024.html" data-stat-id="118b069245f01e0b" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-118b069245f01e0b', '//item.mi.com/1173600024.html', 'pcpid', '']);"> <img src="//i1.mifile.cn/a1/pms_1505897592.73836006!80x80.jpg" width="80" height="80" alt="" /> </a> 
              </div> </td> 
             <td class="col col-name"> <p class="name"> <a target="_blank" href="//item.mi.com/1173600024.html" data-stat-id="9eea1837e2d4c64a" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-9eea1837e2d4c64a', '//item.mi.com/1173600024.html', 'pcpid', '']);">小米笔记本电脑Pro 15 i5 8G 灰色</a> </p> </td> 
             <td class="col col-price"> <p class="price">5599元 &times; 1</p> </td> 
             <td class="col col-actions"> </td> 
            </tr> 
           </tbody>
          </table> 
         </div> 
         <div id="editAddr" class="order-detail-info"> 
          <h3>收货信息</h3> 
          <table class="info-table"> 
           <tbody>
            <tr> 
             <th>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</th> 
             <td>赖胜娇</td> 
            </tr> 
            <tr> 
             <th>联系电话：</th> 
             <td>135****5854</td> 
            </tr> 
            <tr> 
             <th>收货地址：</th> 
             <td>广东 阳江市 阳西县 儒洞镇 北新街36号之一</td> 
            </tr> 
           </tbody>
          </table> 
          <div class="actions"> 
           <a class="btn btn-small btn-line-gray J_editAddr" href="#editAddr" data-get="http://order.mi.com/order/updaterender/orderId/1171021946411519/type/address" data-update="http://order.mi.com/order/updatehandler/orderId/1171021946411519/type/address" data-stat-id="0d84e956b1933b19" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-0d84e956b1933b19', '#editAddr', 'pcpid', '']);">修改</a> 
          </div> 
         </div> 
         <div id="editTime" class="order-detail-info"> 
          <h3>支付方式及送货时间</h3> 
          <table class="info-table"> 
           <tbody>
            <tr> 
             <th>支付方式：</th> 
             <td>在线支付</td> 
            </tr> 
            <tr> 
             <th>送货时间：</th> 
             <td>不限送货时间</td> 
            </tr> 
           </tbody>
          </table> 
          <div class="actions"> 
           <a class="btn btn-small btn-line-gray J_editTime" href="#editTime" data-get="http://order.mi.com/order/updaterender/orderId/1171021946411519/type/time" data-update="http://order.mi.com/order/updatehandler/orderId/1171021946411519/type/time" data-stat-id="3843b6aa29aa2452" onclick="_msq.push(['trackEvent', 'a833eee9cb94c4b4-3843b6aa29aa2452', '#editTime', 'pcpid', '']);"> 修改 </a> 
          </div> 
         </div> 
         <div class="order-detail-info"> 
          <h3>发票信息</h3> 
          <table class="info-table"> 
           <tbody>
            <tr> 
             <th>发票类型：</th> 
             <td>电子发票</td> 
            </tr> 
            <tr> 
             <th>发票内容：</th> 
             <td>购买商品明细</td> 
            </tr> 
            <tr> 
             <th>发票抬头：</th> 
             <td>个人</td> 
            </tr> 
           </tbody>
          </table> 
          <div class="actions"> 
          </div> 
         </div> 
         <div class="order-detail-total"> 
          <table class="total-table"> 
           <tbody>
            <tr> 
             <th>商品总价：</th> 
             <td><span class="num">8198</span>元</td> 
            </tr> 
            <tr> 
             <th>运费：</th> 
             <td><span class="num">0</span>元</td> 
            </tr> 
            <tr> 
             <th class="total">应付金额：</th> 
             <td class="total"><span class="num">8198</span>元</td> 
            </tr> 
           </tbody>
          </table> 
         </div> 
        </div> 
       </div> 
      </div> 
     </div> 
    </div> 
    <div class="clear"></div> 
   </div> 
  </div>


<!-- self_info -->
		    <jsp:include page="footer.jsp"/>
 </body>
</html>