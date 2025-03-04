// If we plan on displaying this for our IT2 prez. We need to comment throughout

import { useState } from "react";

export default function App() {
  const [page, setPage] = useState("home");

  const renderPage = () => {
    switch (page) {
      case "registration":
        return <Registration />;
      case "schedule":
        return <EventSchedule />;
      case "maps":
        return <RouteMaps />;
      case "tradeshow":
        return <TradeshowInfo />;
      case "food":
        return <EatsDrinks />;
      case "sag":
        return <SAGSupport />;
      default:
        return <Home setPage={setPage} />;
    }
  };

  return <div className="p-4 w-full max-w-md mx-auto">{renderPage()}</div>;
}

const Home = ({ setPage }) => (
  <div className="flex flex-col gap-4">
    {[
      ["On-site Registration", "registration"],
      ["HHH Event Schedules", "schedule"],
      ["Route Maps", "maps"],
      ["Tradeshow Info", "tradeshow"],
      ["Eats & Drinks", "food"],
      ["SAG", "sag"],
    ].map(([label, key]) => (
      <button
        key={key}
        className="p-3 bg-blue-500 text-white rounded-xl shadow-md hover:bg-blue-700"
        onClick={() => setPage(key)}
      >
        {label}
      </button>
    ))}
  </div>
);

const Registration = () => (
  <div>
    <h2 className="text-xl font-bold">On-site Registration</h2>
    <input type="text" placeholder="First Name" className="block p-2 border rounded my-2 w-full" />
    <input type="text" placeholder="Last Name" className="block p-2 border rounded my-2 w-full" />
    <button className="p-3 bg-green-500 text-white rounded-xl shadow-md mt-2 hover:bg-green-700">Submit</button>
  </div>
);

const EventSchedule = () => (
  <div>
    <h2 className="text-xl font-bold">HHH Event Schedules</h2>
    <ul className="list-disc pl-5">
      <li>100 Mile Race - 7:00 AM</li>
      <li>50 Mile Race - 8:00 AM</li>
      <li>25 Mile Race - 9:00 AM</li>
    </ul>
  </div>
);

const RouteMaps = () => (
  <div>
    <h2 className="text-xl font-bold">Route Maps</h2>
    <p>Maps will be displayed here.</p>
  </div>
);

const TradeshowInfo = () => (
  <div>
    <h2 className="text-xl font-bold">Tradeshow Info</h2>
    <ul className="list-disc pl-5">
      <li>Bike Gear Expo</li>
      <li>Nutrition & Supplements</li>
      <li>Local Vendors</li>
    </ul>
  </div>
);

const EatsDrinks = () => (
  <div>
    <h2 className="text-xl font-bold">Eats & Drinks</h2>
    <ul className="list-disc pl-5">
      <li>Water Stations</li>
      <li>Energy Bars</li>
      <li>BBQ & Snacks</li>
    </ul>
  </div>
);

const SAGSupport = () => (
  <div>
    <h2 className="text-xl font-bold">SAG Support</h2>
    <p>Calling SAG...</p>
  </div>
);