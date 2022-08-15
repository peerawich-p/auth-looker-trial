view: example_datediff {

  derived_table: {
    sql: SELECT *,
                DATE_DIFF(DATE_CD, lag(DATE_CD) over (partition by customer_cd order by date_cd), DAY) AS DIFF_DATE
        from `CDP.FACT_CUSTOMER`;;
  }

  dimension: date_cd {
    # description: ""
    label: "DATE_CD"
    type: date_time
    sql: ${TABLE}.DATE_CD ;;
  }

  dimension: store_cd {
    label: "STORE_CD"
    type: string
    sql: ${TABLE}.STORE_CD ;;
  }

  dimension: customer_cd {
    label: "CUSTOMER_CD"
    type: string
    sql: ${TABLE}.CUSTOMER_CD ;;
  }

  measure: diff_date {
    label: "DIFF_DATE"
    type: max
    sql: ${TABLE}.DIFF_DATE ;;
  }
}
