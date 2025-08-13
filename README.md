# SmartHMS - 智慧医疗管理系统

一个基于ASP.NET MVC框架开发的现代化医院管理系统，本项目是大三Web程序设计课程设计的优化版本。

## 项目概述

SmartHMS是一个功能完整的智慧医疗管理系统，为医院的日常运营提供全面的信息化支持。系统采用现代化的Web技术栈，提供直观的用户界面和高效的业务流程管理。

## 主要功能模块

### 🏥 核心管理功能
- **医生管理** - 医生信息维护、职务管理、状态跟踪
- **科室管理** - 科室信息管理、科室描述维护
- **用户管理** - 系统用户账户管理、权限控制

### 👥 患者服务功能
- **挂号系统** - 患者信息登记、预约挂号
- **门诊管理** - 门诊患者管理、就诊记录
- **住院管理** - 入院登记、床位分配、出院结算

### 💊 医疗资源管理
- **药房管理** - 药品库存管理、过期药品监控、药品信息维护
- **项目管理** - 医疗项目配置、收费标准管理
- **排班管理** - 医生出诊时间安排、排班信息维护

### 💰 财务管理
- **缴费系统** - 医疗费用结算、支付状态跟踪
- **处方管理** - 药品处方开具、费用计算

## 技术架构

### 后端技术
- **框架**: ASP.NET MVC 5.2.7
- **数据库**: Entity Framework 6.2.0 + SQL Server
- **开发语言**: C# .NET Framework

### 前端技术
- **UI框架**: Bootstrap 3.4.1
- **JavaScript库**: jQuery 3.4.1
- **图标字体**: Font Awesome
- **响应式设计**: 支持多设备适配

### 开发工具与依赖
- **数据处理**: NPOI 2.5.5 (Excel操作支持)
- **JSON处理**: Newtonsoft.Json 12.0.2
- **代码优化**: Web Optimization 1.1.3

## 系统特色

### 🔐 安全特性
- 用户身份验证与授权
- 会话管理
- 数据访问控制

### 📊 数据管理
- 实时数据统计
- 过期药品自动监控
- 患者信息完整跟踪

### 🎨 用户体验
- 响应式界面设计
- 直观的操作流程
- 友好的错误提示

## 项目结构

```
SmartHMS/
├── Controllers/           # MVC控制器
│   ├── HomeController.cs     # 首页和用户管理
│   ├── DCController.cs       # 医生和科室管理
│   ├── OPCController.cs      # 门诊管理
│   ├── ZhuController.cs      # 住院管理
│   ├── PharmacyController.cs # 药房管理
│   ├── ChuController.cs      # 排班管理
│   └── JiaoController.cs     # 缴费管理
├── Models/                # 数据模型
│   ├── Doctor.cs             # 医生实体
│   ├── Guahao.cs             # 挂号实体
│   ├── Medicine.cs           # 药品实体
│   └── ...
├── Views/                 # 视图文件
├── Content/               # 样式文件
├── Scripts/               # JavaScript文件
└── App_Data/              # 数据库文件
```

## 快速开始

### 环境要求
- **开发环境**: Visual Studio 2019或更高版本
- **运行时**: .NET Framework 4.7.2或更高版本
- **数据库**: SQL Server 2016或更高版本
- **Web服务器**: IIS 10.0或更高版本
- **数据库管理工具** (可选): Navicat Premium 或 SQL Server Management Studio

### 安装步骤

1. **克隆项目**
   ```bash
   git clone https://github.com/Dadalia1917/SmartHMS.git
   cd SmartHMS
   ```

2. **数据库配置** (二选一)

   **方法一：使用SQL脚本** ⭐ 推荐
   - 安装并启动SQL Server
   - 打开Navicat Premium，连接到SQL Server
   - 创建新数据库 `HospitalDB`
   - 运行项目根目录下的 `HospitalDB.sql` 脚本（包含完整的表结构和测试数据）
   - 等待脚本执行完成，数据库表和初始数据将自动创建

   **方法二：使用备份文件还原**
   - 打开SQL Server Management Studio
   - 右键"数据库" → "还原数据库"
   - 选择 `Hospital/App_Data/HospitalDB.bak` 备份文件
   - 按提示完成数据库还原
   - ⚠️ **注意**: 如果使用.bak文件，还原后需手动执行以下SQL更新密码：
     ```sql
     UPDATE Login SET Password = 'admin123' WHERE Account = 'admin'
     ```

3. **连接字符串配置**
   - 打开 `Hospital/Web.config` 文件
   - 找到 `<connectionStrings>` 节点
   - 修改连接字符串以匹配你的SQL Server配置：
   ```xml
   <connectionStrings>
     <add name="HospitalDBEntities" 
          connectionString="Data Source=your_server_name;Initial Catalog=HospitalDB;Integrated Security=True" 
          providerName="System.Data.SqlClient" />
   </connectionStrings>
   ```

4. **依赖包还原**
   ```bash
   nuget restore
   ```

5. **编译运行**
   - 在Visual Studio中打开 `Hospital.sln`
   - 确保目标框架为 `.NET Framework 4.7.2`
   - 按F5运行项目
   - 浏览器将自动打开登录页面

### 🔑 默认登录信息
- **管理员账号**: `admin`
- **登录密码**: `admin123`

> **💡 提示**: 首次登录后建议立即修改默认密码以确保系统安全

### 🔧 数据库配置故障排除

**问题1: 数据库连接失败**
```
解决方案：
1. 确认SQL Server服务已启动
2. 检查连接字符串中的服务器名称是否正确
3. 确认数据库名称为 HospitalDB
4. 检查Windows防火墙是否阻止了连接
```

**问题2: Navicat连接SQL Server失败**
```
解决方案：
1. 确保SQL Server配置为允许远程连接
2. 启用SQL Server身份验证模式
3. 检查TCP/IP协议是否启用
4. 确认SQL Server端口（默认1433）是否开放
```

**问题3: 登录失败**
```
解决方案：
1. 确认数据库中存在Login表和相关数据
2. 检查账号密码是否为：admin / admin123
3. 确认医生状态不是"已离职"
4. 清除浏览器缓存重试
```

## 功能截图

*注：实际使用时可以添加系统截图展示*

## 项目背景

本项目起源于大三Web程序设计课程设计，经过多次迭代优化，现已发展为功能完整的医院管理系统。项目在原有基础上进行了以下优化：

- 🔧 代码结构优化，减少冗余
- 🎨 界面美化，提升用户体验  
- 📈 性能优化，提高系统响应速度
- 🛡️ 安全加固，完善权限控制
- 📱 响应式改进，支持移动端访问

## 贡献指南

欢迎提交Issues和Pull Requests来帮助改进项目！

### 开发规范
- 遵循C#编码规范
- 提交前请确保代码能够正常编译
- 添加必要的注释和文档

## 许可证

本项目采用MIT许可证，详情请参阅 [LICENSE](LICENSE) 文件。

---

**注意**: 本项目仅用于学习和研究目的，请勿直接用于生产环境。如需商业使用，请确保符合相关法律法规和医疗行业标准。
