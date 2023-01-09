import opus from "./1555531463974.png";
import money from "./breaking-bad-money.gif";
import stonksImg from "./stonks.gif";
import "./App.css";
import { useState, useEffect } from "react";

function App() {
  const [percent, setPercent] = useState("");
  const [stonks, setStonks] = useState(false);
  const [bbMoney, setBbMoney] = useState(false);

  const increaseSalary = async () => {
    await fetch("http://salary.increaser.com/increase-salary");
  };

  const updatePercent = async () => {
    let newPercent = await getPercent();
    console.log(newPercent);
    setPercent(newPercent);
  };

  const updateSalary = async () => {
    await increaseSalary();
    updatePercent();
  };

  const getPercent = async () => {
    return await fetch("http://salary.increaser.com/get-salary")
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        return data;
      });
  };

  useEffect(() => {
    const updatePercent = async () => {
      let newPercent = await getPercent();
      console.log(newPercent);
      setPercent(newPercent);
    };
    updatePercent();
  }, []);

  useEffect(() => {
    console.log("uepaaa");
    if (percent === 100) {
      setStonks(true);
      console.log("stonks");
    }
    if (percent === 11273632) {
      setBbMoney(true);
      console.log("bbMoney");
    }
    if (percent === 0.5) {
      setStonks(false);
      setBbMoney(false);
      console.log("Voltou");
    }
  }, [percent]);

  return (
    <div
      className="App"
      style={{
        backgroundColor: "lightgrey",
        paddingTop: 150,
        paddingBottom: 350,
      }}
    >
      <div>
        {stonks ? <img src={stonksImg} style={{ height: 300 }} /> : <></>}
        <img src={opus} style={{ height: 300 }} />
        {bbMoney ? <img src={money} style={{ height: 300 }} /> : <></>}
      </div>
      <p style={{ fontSize: 30 }}>
        <code>Percentual de aumento de salário após a apresentação:</code>
      </p>
      <p style={{ fontSize: 50 }}>
        <code>{percent}%</code>
      </p>
      <button
        onClick={updateSalary}
        style={{ fontSize: 30, backgroundColor: "lightblue", borderRadius: 5 }}
      >
        <code>Aumentar Salário</code>
      </button>
    </div>
  );
}

export default App;
