create table vocabulary_english2(
	id int not null auto_increment,
    word_2 varchar(200),
    description_2 varchar(200),
	primary key (id)
) charset=utf8;

select * from vocabulary_english2;

INSERT INTO `vocabulary_english2` (`word_2`, `description_2`) VALUES
("loyalty", "[명사]충실, 충성 , 충성심"),
("eventually", "[부사]결국, 종내"),
("substance", "[명사]물질 , 실체 , 본질, 핵심, 요지 , 중요성"),
("purchase", "[명사]구입, 구매, 매입 , 구입한 것 [동사]구입하다"),
("conduct", "[동사](특정한 활동을) 하다 , 지휘하다 [명사](특정한 장소나 상황에서의) 행동 , 경영, 수행, 처리"),
("principally", "[부사]주로"),
("resident", "[명사](특정 지역) 거주자 , (호텔) 투숙객 [형용사](특정 장소에) 거주하는"),
("viewpoint", "[명사](어떤 주제에 대한) 관점 , (무엇을 바라보는) 방향"),
("ethical", "[형용사]윤리적인, 도덕에 관계된 , 도덕적으로 옳은, 도덕적인"),
("nurture", "[동사](잘 자라도록) 양육하다 , 육성하다 [명사]양육, 육성, 양성"),
("descend", "[동사]내려오다, 내려가다 , (아래로) 경사지다, 내리막이 되다 , 내려앉다"),
("momentary", "[형용사]순간적인, 잠깐의"),
("collision", "[명사]충돌 (사고), 부딪침 , (의견 등의) 충돌"),
("occur", "[동사]일어나다, 발생하다 , (어디에) 존재하다"),
("department", "[명사](정부·기업체·대학 등과 같은 조직의 한) 부서"),
("donor", "[명사]기부자, 기증자 , 헌혈자, (장기) 기증자");