{% test min_value(model, column_name, min_value=0) %}
    {# 
        Custom generic тест на проверку минимального значения столбца.
        Возвращает строки, где значение МЕНЬШЕ заданного min_value.
    #}
    SELECT
        *
    FROM {{ model }}
    WHERE {{ column_name }} < {{ min_value }}

{% endtest %}