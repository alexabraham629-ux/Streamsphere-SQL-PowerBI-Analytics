# Streamsphere-SQL-PowerBI-Analytics.
Advanced SQL and Power BI analytics pipeline decoding user engagement and churn for a streaming platform.
# StreamSphere: The Engagement Puzzle (SQL & Power BI Analytics)

## 📌 Business Challenge
StreamSphere, a regional streaming platform, generates thousands of interactions every minute. While operationally successful, the platform lacked visibility into user intent. The objective of this project was to transition from simply observing *what* users were doing to understanding *why* they were doing it—specifically focusing on browse fatigue, content visibility, and subscriber churn.

## 🛠️ Data Architecture & Schema
Designed a normalized Enterprise Data Warehouse (EDW) utilizing a **Star Schema** optimized for complex OLAP queries across millions of simulated interactions.
* **Dimension Tables:** `dim_users`, `dim_content`, `dim_time` (capturing geography, metadata, and temporal patterns).
* **Fact Tables:** `fact_interactions`, `fact_subscriptions` (tracking granular clicks, pauses, and financial relationships).

## 💻 Advanced SQL Techniques
Leveraged advanced SQL functionality to decode viewing patterns and isolate behavioral segments:
* **Common Table Expressions (CTEs):** Modularized complex logic to calculate total session browse times.
* **Window Functions (LEAD, LAG, ROW_NUMBER):** Sequentially tracked user journeys to identify events preceding an early exit.
* **Conditional Aggregations:** Pivoted transactional data into multi-dimensional engagement profiles.

## 📊 Key Business Insights
1. **The Visibility Paradox:** Highly promoted (Tier 1) content generated 2.1M+ views but suffered a **44.2% early exit rate**, indicating the platform's UI was artificially inflating visibility without delivering value.
2. **Browse Fatigue as a Churn Predictor:** Identified a behavioral segment experiencing choice paralysis. Users exhibiting "High Browse Fatigue" (>10 minutes browsing, no watch time) had a **52.6% churn rate**, compared to just 9.4% for intentional viewers.
3. **The Meaning of Pausing:** A moderate level of pausing (1-3 times) correlated with an 89.5% completion rate, indicating deep narrative engagement. However, sessions with 4+ pauses resulted in a 31.4% completion rate, serving as a real-time signal of severe distraction and abandonment.

## 🚀 Strategic Recommendations
* **Redefine KPIs:** Shift primary metrics from top-of-funnel raw views to the **Start-to-Completion Ratio**.
* **Re-engineer Algorithms:** Weight completion percentages higher than raw clicks in the recommendation engine to break deceptive feedback loops.
* **Deploy Real-Time Interventions:** Trigger dynamic "Surprise Me" prompts when a user exceeds 10 minutes of browsing to disrupt choice paralysis.

## 📁 Repository Contents
* `Streamsphere_Final (1).sql`: Database schema creation, data insertion, and advanced analytical queries.
* `Gemini_Generated_Image_loxc0bloxc0bloxc.png`: Entity-Relationship (ER) Diagram.
* `SQL Final project.pdf`: Comprehensive business impact report.
* `SQL PPT.pptx`: Executive presentation of findings.
