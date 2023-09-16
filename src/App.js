import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1>API URL: {process.env.REACT_APP_API_URL}</h1>
      </header>
    </div>
  );
}

export default App;
