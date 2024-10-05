import pandas as pd

# Sample data
data = {
    "order_id": [1, 2, 3, 4, 5, 6, 7, 8, 9],
    "customer_id": [100, 200, 300, 100, 400, 500, 100, 400, 600],
    "order_date": [
        "2022-01-01", "2022-01-01", "2022-01-01",
        "2022-01-02", "2022-01-02", "2022-01-02",
        "2022-01-03", "2022-01-03", "2022-01-03"
    ],
}

# Create DataFrame
df = pd.DataFrame(data)



df['order_date']=pd.to_datetime(df['order_date'])
df.sort_values('order_date',inplace=True)
df['is_new']=~df['customer_id'].duplicated(keep='first')
df['is_rp']=df['customer_id'].duplicated(keep='first')
df.groupby('order_date').agg(
    new_cx_count=('is_new', 'sum'),
    rp_cx_cnt=('is_rp','sum')
).reset_index()