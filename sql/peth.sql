/*设置客户端连接服务器端编码*/
set names utf8;
/*丢弃数据库，如果存在的话*/
drop database if exists peth;
/*创建新的数据库，设置存储字符的编码*/
create database peth charset=utf8;
/*进入创建的数据库*/
use peth;
#创建用户表
create table user (
  uid int primary key auto_increment,
  uname varchar(32) , #用户名
  upwd varchar(32) not null,
  phone varchar(11) not null,
  avatar varchar(128) default null,#头像路径
  user_name varchar(32), #用户昵称
  gender boolean default 0,
  isAdmin boolean default 0#是否为管理员
);
insert into user values(
  null ,'admin','cgq0822','18434660717', null,'皮皮陈',1,1
);
#创建收货地址表
create table user_address(
  aid int primary key auto_increment,
  user_id int,
  receiver varchar(16),
  province varchar(16),
  city varchar(16),
  county varchar(16),
  cellphone varchar(11),
  address varchar(128),#详细地址
  is_default boolean #是否默认收获
);
#创建购物车表
create table user_shopping_cart(
  cid int primary key auto_increment,
  user_id int ,
  product_id int,
  count int #购买数量
);
#创建订单表
create table user_order(
  aid int primary key auto_increment,
  user_id int ,
  address_id int,
  product_status int, #订单状态
  order_time datetime,#下单时间
  pay_time datetime,#付款时间
  deliver_time datetime#发货时间
);
#创建订单详情表
create table order_detail(
  did int primary key auto_increment,
  order_id varchar(18),#订单编号
  product_id int, #产品编号
  count int #购买数量
);
#创建商品类别表
create table pet_family(
  fid int primary key auto_increment,
  name varchar(32)  #类名名称
);
#创建商品表
create table pet_product(
  lid int primary key auto_increment,
  family_id int, #产品所属家族编号
  product_id int,
  title varchar(128), #主题目
  subtitle varchar(128),
  price decimal(10,2),
  name varchar(32),
  spec varchar(64),#规格
  sold_count int,#售出数量
  category varchar(32),#所属分类
  shelf_time datetime #上架时间 
);
create table peth_pic(
  pid int primary key auto_increment
);
#首页商品栏目表
create table index_product(
  pid int primary key auto_increment,
  title varchar(64),
  details varchar(128),
  price decimal(10,2),
  pic varchar(128),
  href varchar(128) default null
);
#创建文章信息表
create table article(
  atid int primary key auto_increment,
  title varchar(64),
  content varchar(128),
  addtime datetime,
  author varchar(32),
  sort int default 1,
  art_pic varchar(64)
);
insert into article values(
  null ,'养猫需要办证吗？养猫需要办理相关许可证件吗?','饲养猫咪并不需要办什么证件，只要给它在打疫苗后，办理疫苗证就行，而且猫咪经常宅在室内，不会对其他人造成什么影响。猫咪不需要像其他动物一样，需要经常带出去溜，所以它感染疾病的概率要小很多，在饲养过程中只要给它定期做好驱虫，就能将它养得很好。','2022-7-14','pipic',1,'/img/article_images/info01.jpg'
);
insert into article values(
  null ,'犬证代办，服务到家!便民服务就这“范儿”!','上班太忙，没时间带狗狗办理犬证~怎么办?犬证办理申请操作复杂，我不会怎么办?申请流程不熟悉，不知问谁怎么办?','2022-7-14','pipic',1,'/img/article_images/info04.jpg'
);
insert into article values(
  null ,'杜宾为什么要做立耳手术？杜宾做立耳手术的意义是什么?','给杜宾犬做立耳手术也需要注意一些问题，狗狗在术前十二个小时内不能进食，以免造成手术时狗狗出现窒息现象。在手术结束之后，更要要给狗狗的耳朵内放置支撑物，防止耳朵摆动，造成耳朵下垂，那么手术就相当于前功尽弃。而且狗狗术后的恢复时间很长，主人必须要时刻注意杜宾犬耳朵的状况。就手术成功的杜宾犬而言，狗狗的气质方面有很大的提升，整体形象十分完美。所以说给杜宾犬这种类型的犬类做立耳手术是十分有必要的。','2022-7-14','pipic',1,'/img/article_images/info05.jpg'
);
insert into article values(
  null ,'罗威纳几个月开始爆头？罗威纳会在4月龄时开始爆头！','喂食生肉也有助于罗威纳爆头，但长期食用生骨肉的罗威纳体内很可能藏匿着大量寄生虫，如弓形虫、球虫，甚至因此呕吐、腹泻，因此需要定期给吃生食的罗威纳驱虫，以确保它们身体健康。','2022-7-14','pipic',1,'/img/article_images/info06.jpg'
);
insert into article values(
  null ,'巴顿狗是什么狗？巴顿狗有什么特点?','巴顿属于梗犬，但是梗犬也分很多种，具体是哪种就不确定了，不过可以确定的是虽然在电影中巴顿是个流浪狗，但在现实生活中巴顿也是一个有主人疼爱驯养的狗狗。其实影片中的巴顿也是有主人的，它的主人一开始是个邮递员，巴顿经常跟着主人一起送快递，所以特别熟悉这个小区的每家每户，无论是那个楼它都能找的到，也正是因为这个神奇的认路功能，让它和外卖员有了奇妙的缘分。','2022-7-14','pipic',1,'/img/article_images/info07.jpg'
);
insert into article values(
  null ,'狗是靠什么辨别方向的？狗狗靠视觉、听觉、嗅觉和触觉来辨识方向！?','很多对狗狗有些了解的人认为狗狗的视觉不好，不能分辨颜色，甚至是色盲，这样的观点是不够准确的。其实狗狗是能分辨色彩的，站在人类的角度来说，狗狗的色彩世界是很奇怪的;狗狗对眼睛的调节能力比人类差，但视野很开阔，能看得比人类更远，加上头部转动非常灵活，视力范围所到之处，它基本上都能感知。','2022-7-14','pipic',1,'/img/article_images/info08.jpg'
);
insert into article values(
  null ,'狗16岁相当于人的几岁？狗16岁相当于人类的84岁！','狗16岁相当于人类的84岁，虽然一般狗狗的寿命达不到16年，但是如果主人喂养得很好，生活环境也非常好，再加上自身的品种基因和状态，也有少数狗狗能够生活16年。对于狗狗来说，在它们七八岁的时候就已经步入中年状态了，所以能活到16年的狗狗是比较长寿的。','2022-7-14','pipic',1,'/img/article_images/info02.jpg'
);
insert into article values(
  null ,'拉布拉多犬寿命一般多少年?','拉布拉多的寿命一般为8到12岁左右。相对于人类来说，狗狗的体型越大，相应的寿命也会越短。此外，影响拉布拉多寿命的原因除了基因，还有饮食习惯、喂养习惯等因素有关。','2022-7-14','pipic',1,'/img/article_images/info09.jpg'
);
insert into article values(
  null ,'创建全国文明城市|衡阳市开展不文明养犬执法行动?','3月28日，衡阳市高新区华兴派出所民警在太阳广场开展不文明养犬整治活动。针对遛狗不牵绳，养犬不办证，未每年按时给犬只接种狂犬疫苗，犬只在公共场所随地排泄粪便，携犬进入明确不允许进入的公共场所，犬声扰民，犬只伤人，不服从犬类管理、阻碍执法或暴力抗法等问题。','2022-7-14','pipic',1,'/img/article_images/info10.jpg'
);
insert into article values(
  null ,'柯基有体味吗？处理体味最简单的方法是什么?','对于柯基犬来说，它是有体味的，不过不会太严重，处理起来也比较简单。首先要知道引起它体味的原因，通常来说如果长时间都没有给柯基洗澡，这个时候就会有很多细菌都藏在它的毛发中，从而出现臭味。','2022-7-14','pipic',1,'/img/article_images/info11.jpg'
);
insert into article values(
  null ,'柯基是小型犬还是中大型犬?','柯基是小体型的犬种，小型犬是指狗在成年时体重为大概20斤左右，身高在41厘米以下，柯基腿短身长，站起来的时候肩高大概为26厘米;中型犬成年体重为22到60斤，身高在41到60厘米以下，其肩高身高不够中型犬的标准，所以它被划分为小型犬。','2022-7-14','pipic',1,'/img/article_images/info12.jpg'
);
insert into article values(
  null ,'拉布拉多几个月到成年期？拉布拉多成年需要8、9个月?','拉布拉多成年8、9个月，它的幼年期有两个月，从三个月开始就是成长期了，拉布拉多犬一般要长到8个月大小的时候才算是成年犬的体型，三个月开始属于成长期，从8个月开始，还需要5个月的时间才能够成为真正的成犬。','2022-7-14','pipic',2,'/img/article_images/info13.jpg'
);
insert into article values(
  null ,'金毛犬寿命一般多少年？金毛一般达到15岁以上的寿命?','狗狗的寿命一般在13-15年，金毛犬属于大型犬，它的寿命比小型犬要短，一般在10-12岁之间，主要看平时的照顾和狗狗的身体状况，如果狗狗在小时候经历过大型手术，或者有过危及生命的疾病，也会缩短狗狗的寿命，狗狗在六岁之后身体就会走下坡路，这时候要每年带狗狗进行体检，保证狗狗的健康。','2022-7-14','pipic',2,'/img/article_images/info14.jpg'
);
insert into article values(
  null ,'猫狗寿命各是多少年?','通常情况下猫狗的寿命大约在十年左右，少数猫和狗狗的寿命可以长达十五至二十年左右，因此让猫咪和狗狗有一个健康的身体可以有效延长它们的寿命。狗狗和猫咪是人类的伴侣动物，我们一定要好好爱护它们。','2022-7-14','pipic',2,'/img/article_images/info21.jpg'
);
insert into article values(
  null ,'比格犬是哪个国家的？比格犬有什么特征?','比格犬又称为米格鲁猎兔犬，相传比格犬与英国皇室的渊源颇深，约在十六世纪到十七世纪的时期英国正值狩猎风潮。英国皇室养育了许多名犬以配合皇家出游打猎，而短小精悍的比格犬被训练成专门狩猎小型猎物，而小型猎物中以兔子最为灵敏与珍贵，因此兔子经常是比格犬猎捕的重要物件。也因比格犬猎捕兔子成果惊人，因此被冠上“兔子杀手”的称号，久而久之就被称比格犬为猎兔犬。','2022-7-14','pipic',2,'/img/article_images/info15.jpg'
);
insert into article values(
  null ,'德牧的寿命能活多少年？德牧属于大型犬，寿命一般在10岁左右?','德牧属于大型犬，寿命一般在10岁左右。德牧的寿命跟其它大型犬的寿命是一样的。建议饲喂犬粮，不要喂人的食物，六岁以上的德牧要定期体检，会增加寿命。如果照顾比较好的话，寿命会增加，会达到16岁左右。','2022-7-14','pipic',2,'/img/article_images/info16.jpg'
);
insert into article values(
  null ,'小型犬可以不出去溜吗？最好能够每天带狗狗出去溜达?','小型犬可以不出去溜，但是条件允许的情况下，最好能够每天带狗狗出去溜达，几乎所有的狗狗都会觉得遛弯时很快乐的事情，也有了更多的活动空间，有了充足的运动。','2022-7-14','pipic',2,'/img/article_images/info17.jpg'
);
insert into article values(
  null ,'4个月泰迪智商相当于人类几岁？泰迪智商相当于人类3~6岁?','泰迪智商相当于人3~6岁，但泰迪智商虽高，服从性却较差，主人最好在泰迪长到3~5个月的时候就训练它，最晚不要超过2岁再训练，2岁泰迪的性格和生活习惯已经成自然了，很难纠正。泰迪智商如何，主人可以通过观察它的一些行为来判断。','2022-7-14','pipic',2,'/img/article_images/info18.jpg'
);
insert into article values(
  null ,'泰迪狗的寿命是多少年？平均寿命约为12至19年?','泰迪狗的寿命是13年左右，平均寿命约为12至19年，体型较小的狗比体型较大的狗寿命更长，这对于主人来说还是比较短暂的，但是其实我们的科学饲养，是会适当延长狗狗的寿命的。','2022-7-14','pipic',2,'/img/article_images/info19.jpg'
);
insert into article values(
  null ,'长毛的柯基不是纯种吗？如何判断柯基是不是纯种的?','长毛的柯基也会有纯种的，有人认为柯基不能要长毛的，因为长毛柯基属于失格的表现，不过失格并不等于串串，对于没有参赛需求的柯基来说，失不失格没有任何影响，可以被认为是纯种柯基，但如果柯基需要参加各类犬类比赛，那么一旦失格，就失去了参赛的资格。','2022-7-14','pipic',2,'/img/article_images/info020.jpg'
);
##############################################
insert into index_product values(
  null ,'肉香浓郁，鸡肉金针软丝（猫用）','浓纯肉香，激发食欲','25.8','/img/index_images/product01_c.webp','/detail'
);
insert into index_product values(
  null ,'鸡肉虾仁双重鲜美，猫用浓汤白肉罐头','丰富优蛋白，低脂不易胖','89','/img/index_images/product02_c.webp','/detail'
);
insert into index_product values(
  null ,'100%纯肉，宠物每日冻干礼盒 冻干礼盒150克','冻干肉肉君，满满鲜肉力','79','/img/index_images/product03_c.webp','/detail'
);
insert into index_product values(
  null ,'三重除臭，高效结团，混合猫砂 2.5千克','科学配比，四效合一','29','/img/index_images/product04_c.webp','/detail'
);
insert into index_product values(
  null ,'定制专属配方，全价中大型犬犬粮 2千克','呵护关节，稳健成长健骨骼','69','/img/index_images/product01_d.webp','/detail'
);
insert into index_product values(
  null ,'定制配方，专属营养，全价小型犬犬粮','小型犬专属配方，营养美味，减少泪痕','69','/img/index_images/product02_d.webp','/detail'
);
insert into index_product values(
  null ,'看得见的真肉粒，全价三拼犬粮','一口主粮，三种美味','69','/img/index_images/product03_d.webp','/detail'
);
insert into index_product values(
  null ,'看得见的真肉粒，全价三拼犬粮','一口主粮，三种美味','69','/img/index_images/product04_d.webp','/detail'
);