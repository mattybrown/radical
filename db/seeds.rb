Role.create(name: "Admin", access_level: 1)
Role.create(name: "Accounts", access_level: 2)
Role.create(name: "Production", access_level: 3)
Role.create(name: "Agent", access_level: 4)
User.create(name: "matt", last_name: "brown", email: "matt@emarket.digital", password_hash: "$2a$10$Vm1Nu4gNTrbsNMnSHaPxQOlKYL5Z4A1hNZZNrlk5cf5p75hyPe5eu", role_id: 1)
User.create(name: "celina", last_name: "thom", email: "celina@firstnational.co", password_hash: "$2a$10$Vm1Nu4gNTrbsNMnSHaPxQOlKYL5Z4A1hNZZNrlk5cf5p75hyPe5eu", role_id: 2)
User.create(name: "michael", last_name: "rea", email: "michael@firstnational.co", password_hash: "$2a$10$Vm1Nu4gNTrbsNMnSHaPxQOlKYL5Z4A1hNZZNrlk5cf5p75hyPe5eu", role_id: 4)
User.create(name: "simon", last_name: "green", email: "simon@firstnational.co", password_hash: "$2a$10$Vm1Nu4gNTrbsNMnSHaPxQOlKYL5Z4A1hNZZNrlk5cf5p75hyPe5eu", role_id: 4)
User.create(name: "sue", last_name: "duckworth", email: "michael@firstnational.co", password_hash: "$2a$10$Vm1Nu4gNTrbsNMnSHaPxQOlKYL5Z4A1hNZZNrlk5cf5p75hyPe5eu", role_id: 4)
User.create(name: "matt", last_name: "croad", email: "matt@firstnational.co", password_hash: "$2a$10$Vm1Nu4gNTrbsNMnSHaPxQOlKYL5Z4A1hNZZNrlk5cf5p75hyPe5eu", role_id: 3)
AdGroup.create(name: "94 Main St", budget: 600, agent_budget: 150, user_id: 1, canonical: "94mainst", listing_number: 13333)
AdGroup.create(name: "106B Maxwell Rd", budget: 1500, agent_budget: 500, user_id: 1, canonical: "106bmaxwellrd", listing_number: 13334)
AdCategory.create(name: "MPG 1/2 page", price: 250, company_paid: false, mpg_ad: true)
AdCategory.create(name: "MPG 1/2 page COMPANY", price: 250, company_paid: true, mpg_ad: true)
AdCategory.create(name: "Video", price: 300, company_paid: false, mpg_ad: false)
Ad.create(
  name: "testAd",
  reference: "matt-testad-1",
  description: "Ut tortor velit, tempor eget fringilla ac, aliquam non enim. Nam ipsum ipsum, faucibus eget magna a, mollis cursus orci. Sed finibus, risus ac pharetra suscipit, ipsum nisl posuere nulla, ut lobortis nibh felis et mauris. Praesent a ultricies diam, sit amet aliquet neque. Suspendisse in lacus convallis, placerat risus eu, aliquet nisl.",
  deadline: "2017-10-22",
  run_date: "2017-10-22",
  vendor_pays: false,
  ad_group_id: 1,
  ad_category_id: 1,
  created: false,
  approved: false,
  complete: false
)
Ad.create(
  name: "testAd2",
  reference: "matt-testad2-2",
  description: "Ut tortor velit, tempor eget fringilla ac, aliquam non enim. Nam ipsum ipsum, faucibus eget magna a, mollis cursus orci. Sed finibus, risus ac pharetra suscipit, ipsum nisl posuere nulla, ut lobortis nibh felis et mauris. Praesent a ultricies diam, sit amet aliquet neque. Suspendisse in lacus convallis, placerat risus eu, aliquet nisl.",
  deadline: "2017-10-11",
  run_date: "2017-10-10",
  vendor_pays: true,
  ad_group_id: 1,
  ad_category_id: 1,
  created: true,
  approved: false,
  complete: false
)
Ad.create(
  name: "company paid ad",
  reference: "matt-companypaidad-2",
  description: "Ut tortor velit, tempor eget fringilla ac, aliquam non enim. Nam ipsum ipsum, faucibus eget magna a, mollis cursus orci. Sed finibus, risus ac pharetra suscipit, ipsum nisl posuere nulla, ut lobortis nibh felis et mauris. Praesent a ultricies diam, sit amet aliquet neque. Suspendisse in lacus convallis, placerat risus eu, aliquet nisl.",
  deadline: "2017-10-11",
  run_date: "2017-10-10",
  ad_group_id: 1,
  ad_category_id: 2,
  vendor_pays: false,
  created: true,
  approved: false,
  complete: false
)
Ad.create(
  name: "Video ad",
  reference: "matt-videoad-1",
  description: "Ut tortor velit, tempor eget fringilla ac, aliquam non enim. Nam ipsum ipsum, faucibus eget magna a, mollis cursus orci. Sed finibus, risus ac pharetra suscipit, ipsum nisl posuere nulla, ut lobortis nibh felis et mauris. Praesent a ultricies diam, sit amet aliquet neque. Suspendisse in lacus convallis, placerat risus eu, aliquet nisl.",
  deadline: "2017-10-01",
  run_date: "2017-10-12",
  ad_group_id: 2,
  ad_category_id: 3,
  vendor_pays: true,
  created: true,
  approved: true,
  complete: false
)
