alter table customer
 add constraint phoneunique
 unique (phone);


 alter table customer
 add constraint emaileunique
 unique (email);