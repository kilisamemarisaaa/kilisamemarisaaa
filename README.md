<div align="center">

```text
    __  ______    ____  _________ ___ 
   /  |/  /   |  / __ \/  _/ ___//   |
  / /|_/ / /| | / /_/ // / \__ \/ /| |
 / /  / / ___ |/ _, _// / ___/ / ___ |
/_/  /_/_/  |_/_/ |_/___//____/_/  |_|
```

**俞可 · YU KE** — 全栈工程师，把业务从界面、接口、数据到 AI 链路和上线运维端到端做成可运行的系统  
Full-stack engineer. Interfaces, APIs, data, AI pipelines and production operations — delivered end to end.

</div>

---

## ▸ 我能解决的问题 / Engineering focus

- **多角色权限与作业流**：管理员 / 教师 / 学生三端任务发布、开放与指定报名、PDF 答卷上传、教师复核与查重，权限边界用角色路由和共享契约锁住。
- **异步 AI 回调与失败重试**：为 AI 阅卷设计提交状态机，支持 Bearer / Header / HMAC 三种回调鉴权，异步上传、失败重试、批改结果落盘，不靠裸调模型。
- **事务一致性**：积分钱包采用不可变流水 + 事务保证并发一致，审核、授权、邀请等业务规则在服务端统一收口。
- **Agent 边界与安全读接口**：IM Agent 分层为 Web 控制面 / Runtime / Gateway / Session，模型不能越权审核、改分或外发；safe-read 接口只暴露状态、计数与哈希，不回传原始会话材料。

---

## ▸ 代表项目 / Selected work

> 以下项目为真实交付或独立作品，仓库未公开，此处按可核验口径描述。

### 教学作业与 AI 阅卷平台
**全栈 · Next.js / Prisma / SQLite**

- **目标**：把教学作业从收发、批改到归档数字化，三端可用。
- **职责**：独立完成界面、服务端、数据库与外部 AI 集成，含部署冒烟、备份与健康检查。
- **关键设计**：AI 提交状态机 + 三种回调鉴权；异步上传与失败重试；PM2 进程管理与部署冒烟脚本。
- **验证**：生产环境运行，含教师复核与查重环节。

### 销合居销售资源市场
**全栈 · React / Fastify / PostgreSQL**

- **目标**：IT 销售资源协作平台，含审核、积分钱包、联系授权与居主机制。
- **职责**：全栈实现，自然语言 Agent 与业务规则共用同一套服务端逻辑。
- **关键设计**：不可变积分流水 + 事务一致性；模型不能越权审核 / 改分 / 外发。
- **验证**：单元测试到 Playwright E2E 全链路覆盖。

### Kilisame Marisa 数字生命
**独立作品 · Next.js / Python Agent**

- **目标**：可在线运行的 IM 数字生命，私聊 Work Mode / 群聊 Life Mode。
- **职责**：独立完成 Web 控制面、Agent Runtime、QQ Gateway / Session 分层。
- **关键设计**：OpenAI 兼容 bridge + skills 机制；safe-read 仅暴露状态 / 计数 / 哈希。
- **验证**：契约测试与发布门禁保障每次变更。

---

## ▸ 技术栈 / Stack

| 层 | 内容 |
|:--|:--|
| **前端** | TypeScript · React · Next.js · HTML/CSS · 双语与响应式 |
| **服务端与数据** | Node.js · Python · Fastify · Express · PostgreSQL · Prisma · SQLite · MongoDB · Zod |
| **工程质量与 AI** | Playwright E2E · Docker · PM2 · JWT · OSS · OpenAI API · 状态机/回调 · Agent 安全边界 |

工程交付习惯：部署冒烟、备份脚本、健康检查与恢复流程随系统一起交付，不是事后补的。

---

## ▸ 开源动态 / Open source

近期在向 expressjs 上游（body-parser、multer）阅读源码并推进贡献，fork 仓库见主页仓库列表。

---

## ▸ 联系 / Contact

| | |
|:--|:--|
| **GitHub** | [github.com/kilisamemarisaaa](https://github.com/kilisamemarisaaa) |
| **Email** | [1798456934@qq.com](mailto:1798456934@qq.com) |
| **方向** | 全栈 / 教育科技 / AI 应用 |

<div align="center">

<sub>Building systems that survive contact with real users.</sub>

</div>
