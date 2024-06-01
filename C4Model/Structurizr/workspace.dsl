workspace {

    model {
        user = person "Policyholder" "wants to insure its hoverboard 🛹" "Person"
        pricingEngine = softwareSystem "Pricing Engine" ".NET" "External System"
        group "CoolCover Company©" {
            b2cFunnel = softwareSystem "B2C subscription Funnel" "Policy subscription tunnel" {
                b2cFunnelSpa = container "B2C subscription SPA" "Angular"
                !docs docs
                !adrs adrs
            }
            distribution = softwareSystem "Policy distribution service" "Registers new policy" {
                distributionApi = container "Policy distribution API" ".NET"
                policiesDatabase = container "Policies Database" "Stores events on policies and their state as read model projections" "PostgreSQL" "Database"
            }
        }

        user -> b2cFunnelSpa "subscribes" "https"
        b2cFunnelSpa -> pricingEngine "generates a quote" "https/json"
        b2cFunnelSpa -> distributionApi "issues a new policy" "https/json"
        distributionApi -> policiesDatabase "writes" "jdbc"
    }

    views {
        systemlandscape SystemLandscape "C1 SystemLandscape" {
            include *
            autolayout lr
        }

        container distribution {
            include *
            autolayout lr
        }

        container b2cFunnel {
            include *
            autolayout lr
        }

        theme default

        styles {
            element "Database" {
                shape Cylinder
            }

            element "External System" {
                background #C0C0C0
            }
        }
    }

}