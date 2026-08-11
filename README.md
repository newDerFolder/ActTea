# ActTea Combat System Plugin (Early Development)
ActTea is a combat system plugin for Godot 4, currently in early development. It provides basic combat functionalities including attack detection, damage calculation, health management, UI synchronization, and enemy detection.
Core components include: DamageCalculator handles damage calculation, HealthComponent manages character health and death, HealthBarComponent automatically syncs health bar display, HitBoxComponent and HurtboxComponent form the collision-based attack system, and RadarV1 handles enemy detection.
Built with a component-based architecture and signal-driven design, each feature is independently encapsulated with low coupling, making it suitable for quickly prototyping combat systems for ARPGs, MOBAs, turn-based RPGs, and other game types. As it is still under development, some features are relatively basic and will be continuously improved in future updates.

# ActTea 战斗系统插件（开发阶段）
ActTea 是基于 Godot 4 的战斗系统插件，处于早期开发阶段，提供了攻击判定、伤害结算、血量管理、UI 同步和敌人探测等基础战斗功能。
核心组件包括：DamageCalculator 负责伤害计算，HealthComponent 管理角色血量与死亡，HealthBarComponent 自动同步血条显示，HitBoxComponent 与 HurtboxComponent 构成碰撞攻击体系，RadarV1 负责索敌探测。
采用组件化架构和信号驱动设计，各功能独立封装、低耦合，适合快速搭建 ARPG、MOBA、回合制 RPG 等游戏的战斗原型。由于仍在开发中，部分功能较为基础，后续会持续完善。
