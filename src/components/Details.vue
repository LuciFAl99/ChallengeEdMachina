<template>
    <div class="components">
        <div class="details">
            <p class="record-details">Record Details / {{ jsonData.id }}</p>
            <p class="icon-outline">
                <button><v-icon>mdi mdi-view-dashboard-edit-outline</v-icon></button>
            </p>
        </div>
        <div class="titles">
            <a href="#" :class="{ 'active': currentPage === 'overview' }">Overview</a>
            <a href="#">Enrollment</a>
            <a href="#">Academic</a>
        </div>
    </div>
</template>
<script>
import { jsonData } from '../json/menu';
export default {
    data() {
        return {
            jsonData: null,
            currentPage: 'overview',

        };
    },
    mounted() {
        this.jsonData = jsonData.students[0];
    }
}
</script>
<style>
@import '../assets/Style/details.css';
</style>