view: dim_date {

  sql_table_name: CDP.DIM_DATE ;;

  dimension: date_cd {
    label: "DATE_CD"
    type: date_time
    sql: ${TABLE}.DATE_CD ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, hour, date, week, month, year, hour_of_day, day_of_week, month_num, raw, week_of_year,month_name]
    sql: TIMESTAMP(${TABLE}.DATE_CD) ;;
  }
  dimension: date_year_month {
    label: "DATE_YEAR_MONTH"
    type: date_month
    sql: ${TABLE}.DATE_CD ;;
  }
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
