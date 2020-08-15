Select	*
From sys.columns c
	inner join sys.tables t on c.object_id=t.object_id
where t.name not in('TbColumn','TbComputed','TbConstraint','Tbdefault','TbFK','TbView')
	and collation_name=N'Arabic_CI_AS'