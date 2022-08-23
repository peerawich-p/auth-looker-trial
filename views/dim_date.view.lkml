view: dim_date {

  sql_table_name: CDP.DIM_DATE ;;

  dimension: date_cd {
    label: "DATE_CD"
    type: date_time
    sql: ${TABLE}.DATE_CD ;;
  }
  # - dimension: created_year_only

  #   hidden: false

  #   type: int

  #   sql: DATE_PART(year, ${TABLE}.created_date)



  # - dimension: created_date_only

  #   sql: to_char( ${TABLE}.created_date, 'MM-DD' )
  dimension: previous_year_ce {
    type: number
    sql: ${TABLE}.YEAR_CE-1;;
  }
  dimension: date_only {
    sql: to_char( ${TABLE}.DATE_CD, 'MM-DD' ) ;;
  }

  dimension: year_ce {
    label: "YEAR_CE"
    type: number
    sql: ${TABLE}.YEAR_CE;;
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
