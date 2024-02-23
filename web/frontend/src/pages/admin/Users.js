import * as React from "react";

import { ToastContainer, toast } from 'react-toastify';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faEdit, faGear, faSearch, faTrash } from '@fortawesome/free-solid-svg-icons'

import AdminNav from "../../components/AdminNav";
import LoadingOverlay from "../../components/LoadingOverlay";
import GroupModifyPointsModal from "../../components/GroupModifyPointsModal";

function UsersPage(props) {
  const searchRef = React.useRef(null);

  const [users, setUsers] = React.useState([
    // { name: "Brett Kaplan", grade: 12, house: 300, points: 78 },
    // { name: "Brett Kaplan", grade: 12, house: 300, points: 78 },
  ]);

  const [filter, setFilter] = React.useState("");

  const [manageModalOpen, setManageModalOpen] = React.useState(false);

  const [requests, setRequests] = React.useState(0);

  React.useEffect(() => {

    const getUsers = async () => {
      const args = {};
      if (filter) args.filter = filter;

      const res = await fetch(`${process.env.PUBLIC_URL}/admin/api/users`, {
        headers: { Accept: "application/json", "Content-Type": "application/json" },
        method: "POST",
          body: JSON.stringify(args)
      });
      return await res.json();
    }

    setRequests((prev) => prev + 1);
    getUsers().then((userData) => {
      setUsers(userData);
      setRequests((prev) => prev - 1);
    }).catch((err) => {
      setRequests((prev) => prev - 1);
    })

  }, [filter]);

  return (
    <div className="flex flex-row items-stretch min-h-[100vh]">
      <AdminNav selected="users" />
      <LoadingOverlay
        isActive={requests !== 0}
        text='Loading...'
      />
      <GroupModifyPointsModal
        isOpen={manageModalOpen}
        setOpen={setManageModalOpen}
        toast={toast}
      />

      <div className="flex flex-col items-stretch w-full">
        <div className="flex flex-col justify-center text-white text-5xl font-bold bg-blue-950 w-full pl-12 pr-12 items-start max-md:text-4xl max-md:px-5 h-[150px] max-md:max-h-[100px]">
          <span className="my-auto">
            Manage Students
          </span>
        </div>

        <ToastContainer
          position="top-right"
          autoClose={2000}
          hideProgressBar={false}
          newestOnTop
          closeOnClick
          pauseOnFocusLoss
          pauseOnHover
          theme="light"
        />

        <div
          className="flex flex-row justify-between items-stretch max-md:flex-col px-16 pt-8 max-md:p-4"
        >
          <div
            id="searchBox"
            className="flex flex-row justify-start items-stretch w-1/2 gap-4 [&>*]:self-stretch max-md:w-full max-md:flex-col max-md:gap-2 max-md:p-4"
          >
            <input
              onKeyDown={(e) => {
                if (e.key === "Enter") setFilter(e.currentTarget.value)
              }}
              ref={searchRef}
              type="text"
              className="border bg-gray-100 border-slate-600 rounded-xl p-2 w-full"
              placeholder="Search"
            />
            <button
              className="bg-blue-950 text-white px-4 py-2 rounded-xl"
              onClick={() => {
                setFilter(searchRef.current.value);
              }}
            >
              <FontAwesomeIcon icon={faSearch} size="xl" />
            </button>
          </div>
          <div className="max-md:mt-6 max-md:w-full">
            <button
              className="bg-blue-950 text-white px-4 py-2 rounded-xl font-semibold max-md:w-full"
              onClick={() => setManageModalOpen(true)}
            >
              <FontAwesomeIcon icon={faGear} size="lg" className="mr-2" />
              Group Modify Points
            </button>
          </div>
        </div>
        <div
          className="pt-8 px-16 w-full max-md:pt-4 max-md:px-4">
          <table
            className="w-full inner-table"
          >
            <thead className="border-b border-slate-400">
              <tr className="text-xl font-bold">
                <th>Name</th>
                <th>Grade</th>
                <th>House</th>
                <th>Points</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody className="border-slate-400">
              {
                users.map((user, i) =>
                  <tr key={i} className="text-l">
                    <td>{user.name}</td>
                    <td>{["Freshman", "Sophomore", "Junior", "Senior"][user.grade - 9]}</td>
                    <td>{user.house}</td>
                    <td>{user.points}</td>
                    <td className="[&_button]:mx-4">
                      <button className="bg-blue-950 text-white px-4 py-2 rounded-xl max-md:px-[6px]"><FontAwesomeIcon icon={faEdit} size="lg" /></button>
                      <button className="bg-blue-950 text-white px-4 py-2 rounded-xl max-md:px-[6px] max-md:my-[2px]"><FontAwesomeIcon icon={faTrash} size="lg" /></button>
                    </td>
                  </tr>
                )
              }
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default UsersPage;
