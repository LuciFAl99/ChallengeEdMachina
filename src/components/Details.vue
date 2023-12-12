<template>
    <div class="components">
        <div class="details">
            <p class="record-details">Record Details / {{ jsonData.id }}</p>
            <p class="icon-outline">
                <button><v-icon>mdi mdi-view-dashboard-edit-outline</v-icon></button>
            </p>
        </div>
        <div class="titles">
            <a href="#"
                :class="{ 'active': currentPage === 'overview', 'custom-color': currentPage === 'academic' || currentPage === 'enrollment' }">Overview</a>
            <a href="#" :class="{ 'custom-color': currentPage === 'overview' || currentPage === 'academic' }">Enrollment</a>
            <a href="#" :class="{ 'custom-color': currentPage === 'overview' || currentPage === 'enrollment' }">Academic</a>
        </div>
        <v-divider></v-divider>
        <div class="overview">
            <v-card class="overview2">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">mdi-calendar-today</v-icon>
                    </div>
                    <p>Record Age <br>
                       <span class="record-age2"> {{ details.recordAge }}</span>
                    </p>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>Created On</p>
                    <p>{{ details.createdOn }}</p>
                </div>
            </v-card>
            <v-card class="overview2">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">mdi-check-circle</v-icon>
                    </div>
                    <p>Status  <span class="mdi mdi-cog status"></span><br>
                       <span class="record-age2"> {{ details.status }}</span>
                    </p>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>Updated</p>
                    <p class="updated">{{ details.updated }}</p>
                </div>
            </v-card>
            <v-card class="overview2">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">mdi mdi-map-marker</v-icon>
                    </div>
                    <p><span class="country">Country</span><br>
                       <span class="record-age2"> {{ details.country }}</span>
                    </p>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>State</p>
                    <p class="state">{{ details.state }}</p>
                </div>
            </v-card>
            <v-card class="overview2">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">mdi-calendar-today</v-icon>
                    </div>
                    <p>Record Age <br>
                       <span class="record-age2"> {{ details.recordAge }}</span>
                    </p>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>Created On</p>
                    <p>{{ details.createdOn }}</p>
                </div>
            </v-card>
            <v-card class="overview2">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">mdi-calendar-today</v-icon>
                    </div>
                    <p>Record Age <br>
                       <span class="record-age2"> {{ details.recordAge }}</span>
                    </p>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>Created On</p>
                    <p>{{ details.createdOn }}</p>
                </div>
            </v-card>


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
        this.details = jsonData.students[0].details;
    }
}
</script>
<style>
@import '../assets/Style/details.css';
</style>