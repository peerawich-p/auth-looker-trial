view: buying_pattern {
  derived_table: {
    sql:
    WITH
    fact_customer_transaction AS (
    SELECT
    DISTINCT
    CUSTOMER_CD,
    DATE_CD,
    FROM `CDP.FACT_CUSTOMER_TRANSACTION`
    ),
    cal_diff_date AS (
    SELECT
    DATE_CD,
    CUSTOMER_CD,
    DATE_DIFF(DATE_CD, lag(DATE_CD) over (partition by customer_cd order by date_cd), DAY) AS DIFF_DATE,
    FROM fact_customer_transaction
    ),
    cal_median_date AS (
    SELECT
    DISTINCT
    CUSTOMER_CD,
    PERCENTILE_CONT(DIFF_DATE, 0.5) OVER (PARTITION BY CUSTOMER_CD) AS MEDIAN_DIFF_DATE,
    FROM cal_diff_date
    )

    SELECT
    CUSTOMER_CD,
    MEDIAN_DIFF_DATE
    FROM cal_median_date
    ;;
  }

  dimension: customer_cd {
    label: "CUSTOMER_CD"
    type: string
    sql: ${TABLE}.CUSTOMER_CD ;;
  }

  dimension: median_diff_date {
    label: "MEDIAN_DIFF_DATE"
    type: number
    sql: ${TABLE}.MEDIAN_DIFF_DATE ;;
  }
  measure: purchase_value_before_tax {
    label: "PURCHASE_VALUE_BEFORE_TAX"
    type: sum
    sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX ;;
  }
}
