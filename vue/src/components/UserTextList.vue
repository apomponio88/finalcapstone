<template>
  <div class="user-text-list">
    <ul id='list'>
      <div class='welcome'>
        <img class="computerProfilePic" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa4FE9Ts59McoNQf9bvz-xuOFn9-aOzgcVebxCwZ8&s" alt="">
        <p>{{`Welcome, ${$store.state.userName}`}}</p>
      </div>
      <li id="computerChatBubble" v-for='text in $store.state.userText' v-bind:key='text.index'  v-bind:class='text.id'>
        <span class="textBubble">
        <img class="computerProfilePic" v-if="text.id=='computer'" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa4FE9Ts59McoNQf9bvz-xuOFn9-aOzgcVebxCwZ8&s" alt="">
        <p></p>
        <p class='text' v-html = "text.text">{{text.text}}</p>
        <img class="userProfilePic" v-if="text.id=='user'" v-bind:src="$store.state.newPicture">
        </span>
      </li>
    </ul>
  </div> 
  
</template>

<script>

export default {
  name: 'user-text-list',
  props: {text: Object}
}

</script>

<style>
</style>