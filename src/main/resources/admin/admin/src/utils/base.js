const base = {
    get() {
        return {
            url : "http://localhost:8080/tourismrecmngsys/",
            name: "tourismrecmngsys",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/tourismrecmngsys/front/dist/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "旅游推荐管理系统"
        } 
    }
}
export default base
