-- ��ֵ����
-- rand() ����һ�� [0, 1) ֮��������
select RAND()

-- abs() absolute ����ֵ
select abs(-233)

-- ceiling() ����ȡ������ȡ�ȵ�ǰ�������С������ͨ�������ҳ����
select CEILING(0.0001)	-- 1

-- floor() ����ȡ������ȡ�ȵ�ǰ��С���������
select FLOOR(0.0001)	-- 0

-- round(��ֵ�� ����С����λ) 
select ROUND(3.1415, 3)	-- 3.1420
select ROUND(4.5, 0)	-- 5.0
select ROUND(4.6444, 1)	-- 4.6000

-- sign() �������1���������-1��0���0
select SIGN(233)	-- 1
select SIGN(-233)	-- -1

-- power() ƽ��
select POWER(2, 3)	-- 8

--sqrt() ��ƽ��
select SQRT(8)		-- 2.82842712474619