User.create(name: "matt", password: "password", role_id: 1)
Role.create(name: "Admin", access_level: 1)
AdGroup.create(name: "94 Main St", budget: 1000, user_id: 1)
AdGroup.create(name: "106B Maxwell Rd", budget: 1500, user_id: 1)
AdCategory.create(name: "MPG 1/2 page", price: 250)
AdCategory.create(name: "Video", price: 300)
Ad.create(
  name: "testAd",
  description: "Ut tortor velit, tempor eget fringilla ac, aliquam non enim. Nam ipsum ipsum, faucibus eget magna a, mollis cursus orci. Sed finibus, risus ac pharetra suscipit, ipsum nisl posuere nulla, ut lobortis nibh felis et mauris. Praesent a ultricies diam, sit amet aliquet neque. Suspendisse in lacus convallis, placerat risus eu, aliquet nisl.",
  deadline: "2017-10-22",
  run_date: "2017-10-22",
  ad_group_id: 1,
  ad_category_id: 1,
  created: false,
  approved: false,
  complete: false
)
Ad.create(
  name: "testAd2",
  description: "Ut tortor velit, tempor eget fringilla ac, aliquam non enim. Nam ipsum ipsum, faucibus eget magna a, mollis cursus orci. Sed finibus, risus ac pharetra suscipit, ipsum nisl posuere nulla, ut lobortis nibh felis et mauris. Praesent a ultricies diam, sit amet aliquet neque. Suspendisse in lacus convallis, placerat risus eu, aliquet nisl.",
  deadline: "2017-10-11",
  run_date: "2017-10-10",
  ad_group_id: 1,
  ad_category_id: 1,
  created: true,
  approved: false,
  complete: false
)
Ad.create(
  name: "Video ad",
  description: "Ut tortor velit, tempor eget fringilla ac, aliquam non enim. Nam ipsum ipsum, faucibus eget magna a, mollis cursus orci. Sed finibus, risus ac pharetra suscipit, ipsum nisl posuere nulla, ut lobortis nibh felis et mauris. Praesent a ultricies diam, sit amet aliquet neque. Suspendisse in lacus convallis, placerat risus eu, aliquet nisl.", 
  deadline: "2017-10-01",
  run_date: "2017-10-12",
  ad_group_id: 2,
  ad_category_id: 2,
  created: true,
  approved: true,
  complete: false
)