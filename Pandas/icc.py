import pandas as pd

# Creating the pandas DataFrame
data = {
    'Team_1': ['India', 'SL', 'SA', 'Eng', 'Aus'],
    'Team_2': ['SL', 'Aus', 'Eng', 'NZ', 'India'],
    'Winner': ['India', 'Aus', 'Eng', 'NZ', 'India']
}

df = pd.DataFrame(data)
#print(df)


df['loser']=df.apply(lambda row: row['Team_1'] if row['Team_2']==row['Winner'] else row['Team_2'],axis=1)
lose=df['loser'].value_counts().reset_index()
lose.columns=['team','lose']
wins=df['Winner'].value_counts().reset_index()
wins.columns=['team','win']

wins.merge(lose,on='team',how='left').fillna(0)
