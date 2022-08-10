view: fact_customer {

sql_table_name: CDP.FACT_CUSTOMER ;;

dimension: date_cd {
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
dimension: current_segment_group {
  label: "CURRENT_SEGMENT_GROUP"
  type: string
  sql: ${TABLE}.CURRENT_SEGMENT_GROUP ;;
}
dimension: previous_segment_group {
  label: "PREVIOUS_SEGMENT_GROUP"
  type: string
  sql: ${TABLE}.PREVIOUS_SEGMENT_GROUP ;;
}
measure:  acc_12_months_value{
  label: "ACC_12_MONTHS_VALUE"
  type: sum
  sql: ${TABLE}.ACC_12_MONTHS_VALUE;;
}
measure: acc_12_months_frequency {
  label: "ACC_12_MONTHS_FREQUENCY"
  type: sum
  sql: ${TABLE}.ACC_12_MONTHS_FREQUENCY;;
}
measure: lifetime_value {
  label: "LIFETIME_VALUE"
  type: sum
  sql: ${TABLE}.LIFETIME_VALUE;;
}
measure: days_last_purchase {
  label: "DAYS_LAST_PURCHASE"
  type: date_day_of_year
  sql: ${TABLE}.DAYS_LAST_PURCHASE;;
}
measure: recency_percentile {
  label: "RECENCY_PERCENTILE"
  type: number
  sql: ${TABLE}.RECENCY_PERCENTILE;;
}
measure: frequency_percentile {
  label: "FREQUENCY_PERCENTILE"
  type: number
  sql: ${TABLE}.FREQUENCY_PERCENTILE;;
}
measure: monetary_percentile {
  label: "MONETARY_PERCENTILE"
  type: percentile
  percentile: 75
  sql: ${TABLE}.MONETARY_PERCENTILE;;
}
}
