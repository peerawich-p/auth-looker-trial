view: customer_new_count {
    derived_table: {
      explore_source: fact_customer_status_temp {
        column: customer_cd { field: fact_customer_status_temp.customer_cd }
        column: store_cd { field: fact_customer_status_temp.store_cd }
        column: date_cd { field: fact_customer_status_temp.date_cd }
        column: is_new_old { field: fact_customer_status_temp.is_new_old }
      }
    }
    dimension: customer_cd {
      label: "CUSTOMER_CD"
      type: string
      sql: ${TABLE}.customer_cd ;;
    }
    dimension: store_cd {
      label: "STORE_CD"
      type: string
      sql: ${TABLE}.store_cd ;;
    }
    dimension: date_cd {
      label: "CUSTOMER_CD"
      type: date_time
      sql: ${TABLE}.date_cd ;;
    }
  dimension: is_new_old {
    label: "IS_NEW_OLD"
    type: string
    sql: ${TABLE}.is_new_old ;;
  }
    measure: count_customer {
      label: "COUNT_CUSTOMER_TY"
      type: count_distinct
      sql: ${customer_cd} ;;
    }
  measure: count_customer_new {
    label: "COUNT_CUSTOMER_NEW"
    type: count_distinct
    filters: {
      field: is_new_old
      value: "NEW"
    }
    sql: ${customer_cd};;
  }
  }
