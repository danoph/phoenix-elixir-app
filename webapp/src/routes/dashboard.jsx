import Dashboard from 'views/Dashboard/Dashboard.jsx';
import Notifications from 'views/Notifications/Notifications.jsx';
import Icons from 'views/Icons/Icons.jsx';
import Teams from 'views/Teams/Teams.jsx';
import Maps from 'views/Maps/Maps.jsx';
import UserPage from 'views/UserPage/UserPage.jsx';

var dashRoutes = [
    { path: "/teams", name: "Teams", icon: "users_single-02", component: Teams },
    { path: "/dashboard", name: "Dashboard", icon: "design_app", component: Dashboard },
    { path: "/icons", name: "Icons", icon: "design_image", component: Icons },
    { path: "/maps", name: "Maps", icon: "location_map-big", component: Maps },
    { path: "/notifications", name: "Notifications", icon: "ui-1_bell-53", component: Notifications },
    { path: "/user-page", name: "User Profile", icon: "users_single-02", component: UserPage },
    { redirect: true, path: "/", pathTo: "/dashboard", name: "Dashboard" }
];
export default dashRoutes;
