```mermaid
C4Context
title System Context diagram

Person(user, "Policyholder", "wants to insure its hoverboard 🛹", $sprite="users")
System_Ext(pricing, ".NET", "Pricing Engine")

Enterprise_Boundary(coolCover, "CoolCover Company©") {
Container(spa, "B2C Funnel SPA", "angular", "Policy subscription tunnel", $sprite="angular")
Container(api, "Policy distribution API", ".NET", "Registers new policy", $sprite="dotnet")
ContainerDb(db, "Database", "PostgreSQL", "Holds product, order and invoice information", $sprite="postgresql")
}

Rel(user, spa, "subscribes", "https")
Rel(spa, pricing, "generates a quote", "POST https/json")
Rel(spa, api, "Issues a new policy", "POST https/json")
Rel_R(api, db, "Writes")

