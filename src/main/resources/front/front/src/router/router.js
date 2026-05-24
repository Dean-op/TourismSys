import VueRouter from 'vue-router'

//引入组件
import Index from '../pages'
import Home from '../pages/home/home'
import Login from '../pages/login/login'
import Register from '../pages/register/register'
import Center from '../pages/center/center'
import Storeup from '../pages/storeup/list'
import News from '../pages/news/news-list'
import NewsDetail from '../pages/news/news-detail'
import usersList from '../pages/users/list'
import usersDetail from '../pages/users/detail'
import usersAdd from '../pages/users/add'
import weatherList from '../pages/weather/list'
import weatherDetail from '../pages/weather/detail'
import weatherAdd from '../pages/weather/add'
import scenicinfoList from '../pages/scenicinfo/list'
import scenicinfoDetail from '../pages/scenicinfo/detail'
import scenicinfoAdd from '../pages/scenicinfo/add'
import ticketreserveList from '../pages/ticketreserve/list'
import ticketreserveDetail from '../pages/ticketreserve/detail'
import ticketreserveAdd from '../pages/ticketreserve/add'
import hotelinfoList from '../pages/hotelinfo/list'
import hotelinfoDetail from '../pages/hotelinfo/detail'
import hotelinfoAdd from '../pages/hotelinfo/add'
import hotelreserveList from '../pages/hotelreserve/list'
import hotelreserveDetail from '../pages/hotelreserve/detail'
import hotelreserveAdd from '../pages/hotelreserve/add'
import restaurantinfoList from '../pages/restaurantinfo/list'
import restaurantinfoDetail from '../pages/restaurantinfo/detail'
import restaurantinfoAdd from '../pages/restaurantinfo/add'
import restaurantreserveList from '../pages/restaurantreserve/list'
import restaurantreserveDetail from '../pages/restaurantreserve/detail'
import restaurantreserveAdd from '../pages/restaurantreserve/add'
import trafficrouteList from '../pages/trafficroute/list'
import trafficrouteDetail from '../pages/trafficroute/detail'
import trafficrouteAdd from '../pages/trafficroute/add'
import travelguideList from '../pages/travelguide/list'
import travelguideDetail from '../pages/travelguide/detail'
import travelguideAdd from '../pages/travelguide/add'
import tourplanList from '../pages/tourplan/list'
import tourplanDetail from '../pages/tourplan/detail'
import tourplanAdd from '../pages/tourplan/add'
import feedbackList from '../pages/feedback/list'
import feedbackDetail from '../pages/feedback/detail'
import feedbackAdd from '../pages/feedback/add'
import myticketList from '../pages/myticket/list'
import myhotelList from '../pages/myhotel/list'
import myrestaurantList from '../pages/myrestaurant/list'
import pay from '../pages/pay'
import recommend from '../pages/recommend/recommend'



const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}

import guideList from '../pages/guide/list'
import guideDetail from '../pages/guide/detail'

import myguideorderList from '../pages/guide/myorder'

//配置路由
export default new VueRouter({
	routes: [
		{
			path: '/',
			redirect: '/index/home'
		},
		{
			path: '/index',
			component: Index,
			children: [
				{
					path: 'home',
					component: Home
				},
				{
					path: 'center',
					component: Center,
				},
				{
					path: 'myguideorder',
					component: myguideorderList
				},
				{
					path: 'guide',
					component: guideList
				},
				{
					path: 'guideDetail',
					component: guideDetail
				},
				{
					path: 'storeup',
					component: Storeup
				},
				{
					path: 'news',
					component: News
				},
				{
					path: 'newsDetail',
					component: NewsDetail
				},
				{
					path: 'users',
					component: usersList
				},
				{
					path: 'usersDetail',
					component: usersDetail
				},
				{
					path: 'usersAdd',
					component: usersAdd
				},
				{
					path: 'weather',
					component: weatherList
				},
				{
					path: 'weatherDetail',
					component: weatherDetail
				},
				{
					path: 'weatherAdd',
					component: weatherAdd
				},
				{
					path: 'scenicinfo',
					component: scenicinfoList
				},
				{
					path: 'scenicinfoDetail',
					component: scenicinfoDetail
				},
				{
					path: 'scenicinfoAdd',
					component: scenicinfoAdd
				},
				{
					path: 'ticketreserve',
					component: ticketreserveList
				},
				{
					path: 'ticketreserveDetail',
					component: ticketreserveDetail
				},
				{
					path: 'ticketreserveAdd',
					component: ticketreserveAdd
				},
				{
					path: 'hotelinfo',
					component: hotelinfoList
				},
				{
					path: 'hotelinfoDetail',
					component: hotelinfoDetail
				},
				{
					path: 'hotelinfoAdd',
					component: hotelinfoAdd
				},
				{
					path: 'hotelreserve',
					component: hotelreserveList
				},
				{
					path: 'hotelreserveDetail',
					component: hotelreserveDetail
				},
				{
					path: 'hotelreserveAdd',
					component: hotelreserveAdd
				},
				{
					path: 'restaurantinfo',
					component: restaurantinfoList
				},
				{
					path: 'restaurantinfoDetail',
					component: restaurantinfoDetail
				},
				{
					path: 'restaurantinfoAdd',
					component: restaurantinfoAdd
				},
				{
					path: 'restaurantreserve',
					component: restaurantreserveList
				},
				{
					path: 'restaurantreserveDetail',
					component: restaurantreserveDetail
				},
				{
					path: 'restaurantreserveAdd',
					component: restaurantreserveAdd
				},
				{
					path: 'trafficroute',
					component: trafficrouteList
				},
				{
					path: 'trafficrouteDetail',
					component: trafficrouteDetail
				},
				{
					path: 'trafficrouteAdd',
					component: trafficrouteAdd
				},
				{
					path: 'travelguide',
					component: travelguideList
				},
				{
					path: 'travelguideDetail',
					component: travelguideDetail
				},
				{
					path: 'travelguideAdd',
					component: travelguideAdd
				},
				{
					path: 'tourplan',
					component: tourplanList
				},
				{
					path: 'tourplanDetail',
					component: tourplanDetail
				},
				{
					path: 'tourplanAdd',
					component: tourplanAdd
				},
				{
					path: 'feedback',
					component: feedbackList
				},
				{
					path: 'feedbackDetail',
					component: feedbackDetail
				},
				{
					path: 'feedbackAdd',
					component: feedbackAdd
				},
				{
					path: 'myticket',
					component: myticketList
				},
				{
					path: 'myhotel',
					component: myhotelList
				},
				{
					path: 'myrestaurant',
					component: myrestaurantList
				},
				{
					path: 'pay',
					component: pay
				},
				{
					path: 'recommend',
					component: recommend
				},
			]
		},
		{
			path: '/login',
			component: Login
		},
		{
			path: '/register',
			component: Register
		},

	]
})
