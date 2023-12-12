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
                    <div>
                        <p class="record-age2">Record Age
                        <p class="record-age3"> {{ details.recordAge }}</p>
                        </p>
                    </div>
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
                    <div>
                        <p class="record-age2">Status<span class="mdi mdi-cog status"></span>
                        <p class="record-age3"> {{ details.status }}</p>
                        </p>
                    </div>
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
                    <div>
                        <p class="record-age2 country">Country
                        <p class="record-age3"> {{ details.country }}</p>
                        </p>
                    </div>
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
                        <v-icon color="white">mdi mdi-file-account</v-icon>
                    </div>
                    <div>

                    </div>
                    <div>
                        <p class="record-age2 country">Last Contact
                        <p class="record-age3"> {{ lastContact.days }}</p>
                        </p>
                    </div>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>{{lastContact.date}}</p>
                    <p class="hour">{{ lastContact.hour }}</p>
                </div>
            </v-card>
            <v-card class="overview2">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">mdi-chart-line-variant</v-icon>
                    </div>
                    <div>
                        <p class="record-age2 country">Last Activity
                        <p class="record-age3"> {{ lastActivity.days }}</p>
                        </p>
                    </div>
                </div>
                <v-divider></v-divider>
                <div class="created-on">
                    <p>{{lastActivity.date}}</p>
                    <p class="hour">{{ lastActivity.hour }}</p>
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
        this.lastContact = jsonData.students[0].details.lastContatct;
        this.lastActivity = jsonData.students[0].details.lastActivity;
    }
}
</script>
<style>
@import '../assets/Style/details.css';
</style>