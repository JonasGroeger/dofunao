<script>

export default {
  data() {
    return {
      servings: 1,
      dryBeansPerServing: 30,

      // How much water dry soy beans soak by weight.
      // Example: A value of 2.2 means 1g of soy bean will be 2.2g after soaking over night.
      beansSoakingFactor: 2.2,

      // How much water to add to the soaked soybeans by weight.
      // A value of 5 means if you add 1g of soaked soybeans to your blender, add 5g of water.
      waterAddedFactor: 5
    }
  },

  computed: {
    dryBeans: {
      get() {
        return this.dryBeansPerServing * this.servings;
      },
      set(v) {
        this.servings = this.servings = v / this.dryBeansPerServing;
      }
    },
    soakedBeans() {
      return (
        Math.round((this.dryBeans * this.beansSoakingFactor) / 10) * 10
      );
    },
    waterAddedToBlender() {
      return (
        Math.round((this.soakedBeans * this.waterAddedFactor) / 10) * 10
      );
    },
    milk() {
      return (
        Math.round(
          (this.soakedBeans + this.waterAddedToBlender - this.pulp) / 10
        ) * 10
      );
    },
    gdl() {
      return Math.round(0.0045 * this.milk * 10) / 10;
    },
    pulp() {
      return Math.round((1.6 * this.dryBeans) / 10) * 10;
    }
  }
}
</script>

<template>
  <h1>豆腐脑 (Dou Fu Nao) calculator (beta)</h1>
  <ul>
    <li>
      I would like to make
      <input
        min="0.5"
        max="99"
        step="0.5"
        type="number"
        inputmode="numeric"
        v-model="servings"
      />
      serving(s) of Dou Fu Nao.
    </li>
    <li>
      I would like to make
      <input
        min="15"
        max="1000"
        step="15"
        type="number"
        inputmode="numeric"
        v-model="dryBeans"
      />
      g of dry soy beans into Dou Fu Nao.
    </li>
  </ul>

  <h2>Instructions</h2>

  <ol>
    <li>
      Soak {{ dryBeans }}g of soy beans overnight. This will produce
      <i>about</i>
      {{ soakedBeans }}g soaked soy beans.
    </li>
    <li>
      Blend {{ soakedBeans }}g soaked soy beans with {{ waterAddedToBlender }}g
      of water
    </li>
    <li>Strain the mixture</li>
    <li>Bring the {{ milk }}ml of soymilk to a boil and scoop away the foam</li>
    <li>Cool down to below 80°C</li>
    <li>Add {{ gdl }}g GDL and mix thogoughly for 5s</li>
    <li>Scoop out foam from the surface (optional)</li>
    <li>Wait 15 minutes</li>
  </ol>
  <p>
    You'll have
    <i>about</i>
    {{ pulp }}g of soy pulp left over to use in
    other dishes.
  </p>

  <p class="author">
    Made by
    <a href="https://jonasgroeger.de/">Jonas Gröger</a>
  </p>
</template>

<style>
.author {
  text-align: right;
}
</style>
