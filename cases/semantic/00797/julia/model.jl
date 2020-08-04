#= 
    This code was generated by heta-compiler of v0.5.9
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    C = 1.0
    k1 = 0.75
    p1 = 0.00125
    S1 = 2.0 * p1
    S2 = 0.02
    reaction1 = C * k1 * S1 * S2
    k2 = 0.25
    S3 = 0.01
    reaction2 = C * k2 * S3
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
            S3 * C,
        ],
        
        [
            C,
            k1,
            k2,
            p1,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k1,k2,p1,) = p.static
    (S1_,S2_,S3_,) = u 

    # Heta rules
    S1 = S1_ / C
    S2 = S2_ / C
    reaction1 = C * k1 * S1 * S2
    S3 = S3_ / C
    reaction2 = C * k2 * S3
    
    #p.static .= [C,k1,k2,p1,]
    du .= [
      -reaction1+reaction2,  # dS1_/dt
      -reaction1+reaction2,  # dS2_/dt
      reaction1-reaction2,  # dS3_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k1,k2,p1,) = integrator.p.static
        (S1_,S2_,S3_,) = u

        # Heta rules
        S1 = S1_ / C
        S2 = S2_ / C
        reaction1 = C * k1 * S1 * S2
        S3 = S3_ / C
        reaction2 = C * k2 * S3
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
        reaction2_ = reaction2
        k1_ = k1
        k2_ = k2
        p1_ = p1

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events

### continous events

### event assignments


### OUTPUT ###

x00797 = Model(
  start_,
  ode_,
  [
  ],
  make_saving_,
  constants_
)

models = (
    x00797 = x00797
)
tasks = ()

export models, tasks

end
