-- ����ת������ --
print 1 + 'a'
print '�ҵķ����ǣ�' + 100

-- cast(ԭֵ as Ŀ������)
print '�ҵķ����ǣ�' + cast(100 as char(3))

-- convert(Ŀ������, Դ����, [��ʽ]) <--��ʽ������ڡ�����ֵ������
print '�ҵķ����ǣ�' + convert(char(3), 100)

print '�ҵ������ǣ�' + convert(char(20), getdate(), 101)