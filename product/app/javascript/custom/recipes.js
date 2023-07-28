document.getElementById('add-ingredient-button').addEventListener('click', function () {
  // モーダルウィンドウから材料と分量を取得
  var ingredientId = document.querySelector('#ingredientModal select').value;
  var quantityInGrams = document.querySelector('#ingredientModal input[type="number"]').value;

  // フォームに追加するコードを作成
  var newIngredientHtml = `
    <div class="field">
      <input type="hidden" name="recipe[recipe_ingredients_attributes][0][ingredient_id]" value="${ingredientId}">
      <input type="hidden" name="recipe[recipe_ingredients_attributes][0][quantity_in_grams]" value="${quantityInGrams}">
      <p>材料ID: ${ingredientId}, 分量: ${quantityInGrams}g</p>
    </div>
  `;

  // フォームに新たな材料を追加
  document.querySelector('.recipe-ingredients').innerHTML += newIngredientHtml;

  // モーダルを閉じる
  $('#ingredientModal').modal('hide');
});
