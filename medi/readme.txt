1.���ܽű��ļ���
	tar -czvf - -C ./ [Ҫ���ܵ��ļ�] | openssl des3 -salt -k 617999 -out [���ܺ���ļ�]
2. ����
	openssl des3 -d -k 617999 -salt -in %s.txt | tar xzf - 
