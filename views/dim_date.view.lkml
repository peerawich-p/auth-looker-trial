view: dim_date {

  sql_table_name: CDP.DIM_DATE ;;

  dimension: date_cd {
    label: "DATE_CD"
    primary_key: yes
    type: date_time
    sql: ${TABLE}.DATE_CD ;;
  }

  dimension: year_ce {
    label: "YEAR_CE"
    type: number
    sql: ${TABLE}.YEAR_CE ;;
  }

  dimension: year_be {
    label: "YEAR_BE"
    type: number
    sql: ${TABLE}.YEAR_BE ;;
  }

  dimension: month_no {
    label: "MONTH_NO"
    type: number
    sql: ${TABLE}.MONTH_NO ;;
  }

  dimension: day_of_month {
    label: "DAY_OF_MONTH"
    type: number
    sql: ${TABLE}.DAY_OF_MONTH ;;
  }
}
