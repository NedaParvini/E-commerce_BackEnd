const router = require('express').Router();
const { Category, Product } = require('../../models');

// The `/api/categories` endpoint

router.get('/', (req, res) => {
  // find all categories
  // be sure to include its associated Products
  Category.all((data) => {
    //console.log("data",data);
    let hbsObject = {
        category: data.rows
    };
    console.log("category-routes",data.rows);
    res.render('index', hbsObject);
});
});

router.get('/:id', (req, res) => {
  // find one category by its `id` value
  // be sure to include its associated Products
});

router.post('/', (req, res) => {
  // create a new category
  Category.create(
    ["category_name", "devoured"],
    [req.body.category_name, req.body.devoured],
    (result) => {
        res.json({ id: result.id });
    }
);
});

router.put('/:id', (req, res) => {
  // update a category by its `id` value
  const condition = "id = " + req.params.id;

    console.log("condition", condition);
    console.log("req", req);
    console.log("res", res);

    Category.update(
        { devoured: req.body.devoured },
        condition,
        (result) => {
            if (result.changedRows === 0) {
                return res.status(404).end();
            } else {
                res.status(200).end();
            }
        }
    );
});

router.delete('/:id', (req, res) => {
  // delete a category by its `id` value
  const condition = "id = " + req.params.id;

  Category.delete(condition, (result) => {
      if (result.affectedRows === 0) {
          return res.status(404).end();
      } else {
          res.status(200).end();
      }
  });
});

module.exports = router;
