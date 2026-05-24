-- 确保使用的是 boot_tourismrecmngsys 数据库
USE boot_tourismrecmngsys;

-- 清理旧的测试脏数据（可选，防止多次运行重复插入）
DELETE FROM scenicinfo WHERE merchantusername = 'shop1';
DELETE FROM hotelinfo WHERE merchantusername = 'shop1';
DELETE FROM restaurantinfo WHERE merchantusername = 'shop1';

-- 定义变量获取商户名称
SET @m_name = (SELECT merchantname FROM merchant WHERE merchantusername = 'shop1' LIMIT 1);
SET @m_name = IFNULL(@m_name, '绿野仙踪度假村');

-- 插入景点模拟数据
INSERT INTO scenicinfo (scenicname, address, sceniclevel, price, telephone, opentime, introduce, scenicphoto, content, merchantusername, merchantname, rating) VALUES
('绿野仙踪秘境峡谷', '桂林市阳朔县绿野谷景区1号', 'AAAAA', 85, '0773-8888888', '08:00 - 18:00', '秘境峡谷四周环山，绿树成荫，清澈的泉水在溪流中叮咚作响，是大自然鬼斧神工的杰作。', 'upload/scenic1.jpg', '<h3>绿野仙踪秘境峡谷详情介绍</h3><p>这里有最原始的峡谷森林风貌，沿途有飞瀑十里，怪石嶙峋。非常适合家庭亲子出游、避暑与户外拓展探险。</p>', 'shop1', @m_name, 4.9),
('云顶漫步观景台', '桂林市阳朔县云顶山颠', 'AAAA', 60, '0773-9999999', '09:00 - 21:00', '置身云顶之上，俯瞰喀斯特地貌的绝美画卷，落日余晖中仿佛漫步云端。', 'upload/scenic2.jpg', '<h3>云顶漫步观景台详情介绍</h3><p>云顶漫步观景台是阳朔最高地标之一，拥有360度全景无死角视野。傍晚时分可在此处静候落日，看万家灯火与漫天霞光交相辉映。</p>', 'shop1', @m_name, 4.7);

-- 插入酒店模拟数据
INSERT INTO hotelinfo (hotelname, hoteltype, address, roomtype, price, telephone, introduce, hotelphoto, content, merchantusername, merchantname) VALUES
('绿野仙踪星空树屋酒店', '特色度假酒店', '桂林市阳朔县绿野谷景区星空营地', '豪华套房', 1280, '0773-8888666', '树屋悬浮于古木之间，清晨在鸟鸣中醒来，夜晚躺在床上透过全景玻璃穹顶仰望璀璨星空。', 'upload/hotel1.jpg', '<h3>星空树屋酒店入住体验</h3><p>全屋配置智能家居系统，配有独立的室外观景平台和私汤温泉。为您在喧嚣都市外提供一个真正能呼吸、能触碰繁星的梦幻空间。</p>', 'shop1', @m_name),
('隐山清溪精品民宿', '精品民宿', '桂林市阳朔县隐山清溪畔', '山水景观房', 680, '0773-8888777', '伴溪而居，竹林掩映，简约的新中式设计透露着禅意，是洗涤心灵的静谧之所。', 'upload/hotel2.jpg', '<h3>隐山清溪民宿详情</h3><p>民宿内设有茶室、书吧和溪畔秋千，所有床品均为高星级标准定制，带给您极佳的睡眠质量。推窗即见竹林摇曳，流水潺潺。</p>', 'shop1', @m_name);

-- 插入餐厅模拟数据
INSERT INTO restaurantinfo (restaurantname, address, businesstime, avgprice, reserveprice, introduce, restaurantphoto, content, merchantusername, merchantname, rating, telephone) VALUES
('野趣竹林溪畔私房菜', '桂林市阳朔县绿野谷景区竹林深处', '11:00-21:30', 120, 20, '选用林间天然食材与溪中野生游鱼，招牌竹筒鸡与啤酒鱼口味地道，在溪水潺潺声中品味自然野趣。', 'upload/restaurant1.jpg', '<h3>野趣竹林私房菜推荐菜品</h3><p>招牌推荐：竹耳竹笋炒腊肉、柴火竹筒鸡、山泉水炖走地鸡、阳朔正宗啤酒鱼。菜品清淡鲜美，回味无穷。</p>', 'shop1', @m_name, 4.8, '0773-8888111'),
('云顶日落悬崖西餐厅', '桂林市阳朔县云顶山颠悬崖边', '14:00-22:00', 280, 50, '绝美的悬崖落日景观，配以顶级牛排与醇香红酒，在晚霞的浪漫光影中享受极致的视觉与味觉盛宴。', 'upload/restaurant2.jpg', '<h3>云顶日落悬崖西餐详情</h3><p>提供法式精致西餐，大厨精选进口M7和牛与新鲜黑松露，是情侣约会、求婚以及高端沙龙聚会的黄金首选地标。</p>', 'shop1', @m_name, 4.9, '0773-8888222');
